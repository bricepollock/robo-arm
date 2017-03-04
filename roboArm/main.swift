//
//  main.swift
//  roboArm
//
//  Created by Brice Pollock on 3/3/17.
//  Copyright © 2017 Brice Pollock. All rights reserved.
//

import Foundation


// initialization stuff
let standardError = FileHandle.standardError
var arguments = CommandLine.arguments
let programName = CommandLine.arguments[0]


arguments.removeFirst() // strip the 'progam name from the arguments list

typealias SlotList = [Int]

// Handle Starting up the program
guard arguments.count > 0,
    let startCommand = ArmCommands(rawValue: arguments[0]),
    startCommand.validate(arguments: arguments, currentSlotSize: 0) else {
        
    standardError.write("Invalid Argument\n\n")
    standardError.write(programUsagePrompt)
    exit(EXIT_FAILURE)
}

guard startCommand == .size else {
    standardError.write(programUsagePrompt)
    exit(EXIT_FAILURE)
}
let slotListSize = Int(arguments[1])
guard let size = slotListSize else {
    standardError.write("Invalid Size\n\n")
    exit(EXIT_FAILURE)
}

// Global Variables
var slotHistory = [SlotList]()

// having to unwrap here because Swift says it doesn't know about size even though it is defined above. I don't have time to dig deeper given time.
var currentSlotList = SlotList(repeating: 0, count: slotListSize ?? 0)

// Record the initial state
slotHistory.append(currentSlotList)

// Lets start the program
startInterativeConsole()

exit(EXIT_SUCCESS)
