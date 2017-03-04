//
//  Program.swift
//  roboArm
//
//  Created by Brice Pollock on 3/3/17.
//  Copyright © 2017 Brice Pollock. All rights reserved.
//

import Foundation

// TODO: If I had more time I'd write a shell script and non-interactive mode that could take a list of commands.
// I'd use that script to write integration tests for this
func startInterativeConsole() {
    print("Welcome to RoboArm 3000 version 1.0 start by specifying the number of slots in your system.\n")
    print("Interact with the system with the follwing commands:\n")
    printProgramUsage(programName: programName)
    
    while true {
        let input = getInput()
        let params = input.components(separatedBy: " ")
        
        guard params.count >= 1,
            let command = ArmCommands(rawValue: params[0]),
            command.validate(arguments: params, currentSlotSize: currentSlotList.count) else {
                standardError.write("Invalid Argument\n")
                printProgramUsage(programName: programName)
                continue
        }
        
        guard command != .help && command != .exit && command != .print else {
            switch command {
            case .help:
                printProgramUsage(programName: programName)
            case .exit:
                exit(EXIT_SUCCESS)
            case .print:
                printSlotState(slotList: currentSlotList)
            default:
                print("Error Code 2")
            }
            continue
        }
        
        guard let firstNumberedParam = Int(params[1]) else {
            printInvalidUsage()
            continue
        }
        
        switch command {
        case .size:
            let newSize = firstNumberedParam
            var newSlotList = SlotList(repeating: 0, count: newSize)
            for index in 0..<newSize {
                if index >= currentSlotList.count {
                    break
                }
                newSlotList[index] = currentSlotList[index]
            }
            currentSlotList = newSlotList
        case .add:
            let slotIndex = firstNumberedParam
            currentSlotList[slotIndex] += 1
        case .mv:
            guard let secondNumberedParam = Int(params[2]) else {
                printInvalidUsage()
                continue
            }
            
            let firstSlot = firstNumberedParam
            let secondSlot = secondNumberedParam
            
            if currentSlotList[firstSlot] > 0 {
                currentSlotList[firstSlot] -= 1
                currentSlotList[secondSlot] += 1
            }
        case .rm:
            let slotIndex = firstNumberedParam
            guard currentSlotList[slotIndex] > 0 else {
                standardError.write("Cannot remove, no blocks in slot\n\n")
                continue
            }
            currentSlotList[slotIndex] -= 1
        case .replay:
            // TODO: I prioritized unit tests, testing and other design over implementing this method
            // If I had time I'd write a structure that takes the enum + args and then cache those structures like the slotHistory array
            standardError.write("This command is not available. Please update your firmware.\n\n")
            continue
        case .undo:
            guard !slotHistory.isEmpty else {
                standardError.write("Cannot undo, no more actions\n\n")
                continue
            }
            var actionsToUndo = firstNumberedParam
            while actionsToUndo > 0 && !slotHistory.isEmpty {
                actionsToUndo -= 1
                slotHistory.removeLast()
                guard let last = slotHistory.last else {
                    continue
                }
                currentSlotList = last
            }
        case .help, .exit, .print:
            print("Error Code 3")
        }
        
        printSlotState(slotList: currentSlotList)
        slotHistory.append(currentSlotList)
    }
}
