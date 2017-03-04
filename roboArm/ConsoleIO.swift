//
//  ConsoleIO.swift
//  roboArm
//
//  Created by Brice Pollock on 3/3/17.
//  Copyright © 2017 Brice Pollock. All rights reserved.
//

import Foundation


extension FileHandle: TextOutputStream {
    public func write(_ string: String) {
        guard let data = string.data(using: .utf8) else { return }
        self.write(data)
    }
}

let programUsagePrompt = "Start the program by specifying the number of slots using the size method.\n\n\(ArmCommands.size.usageDescription())\n"

func printProgramUsage(programName: String) {
    for command in ArmCommands.allValues {
        print("\(command.usageDescription())")
    }
}

func printInvalidUsage() {
    standardError.write("Invalid Command!\n")
    printProgramUsage(programName: programName)
}

func printSlotState(slotList: SlotList) {
    for (index, numBlocks) in slotList.enumerated() {
        var blockString = ""
        for _ in 0..<numBlocks {
            blockString.append("X")
        }
        print("\(index): \(blockString)")
    }
}

func getInput() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    let strData = String(data: inputData, encoding: String.Encoding.utf8)!
    
    return strData.trimmingCharacters(in: CharacterSet.newlines)
}
