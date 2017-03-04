//
//  ArmCommand.swift
//  roboArm
//
//  Created by Brice Pollock on 3/3/17.
//  Copyright © 2017 Brice Pollock. All rights reserved.
//

import Foundation

// TODO: If I had more time I'd likely add associated values here so I could completely represent a command + its arguments 
// within the enum. That would also avoid the additional casting I had to do after the validation method.
enum ArmCommands: String, EnumCollection {
    case size
    case add
    case mv
    case rm
    case replay
    case undo
    case help
    case exit
    case print
    
    func usageDescription() -> String {
        let commandName = "\(self.rawValue)"
        switch self {
        case .size:
            return commandName + " [n] - Adjusts the number of slots, resizing if necessary. Program must start with this to be valid."
        case .add:
            return commandName + " [slot] - Adds a block to the specified slot."
        case .mv:
            return commandName + " [slot1] [slot2] - Moves a block from slot1 to slot2."
        case .rm:
            return commandName + " [slot] - Removes a block from the slot."
        case .replay:
            return commandName + " [n] - Replays the last n commands."
        case .undo:
            return commandName + " [n] - Undo the last n commands."
        case .help:
            return commandName + " - Explains usage for robo arm system"
        case .exit:
            return commandName + " - Exit interactive mode"
        case .print:
            return commandName + " - Show current slot / blocks"
        }
    }
    
    /// Takes in the arguments list and outputs whether can execute this action
    /// First argument in list should be the commmand.
    func validate(arguments: [String], currentSlotSize: Int) -> Bool {
        switch self {
        case .size:
            guard arguments.count == 2, let firstArgument = Int(arguments[1]) else {
                return false
            }
            return firstArgument > 0
        case .mv:
            guard arguments.count == 3,
                let firstArgument = Int(arguments[1]),
                let secondArgument = Int(arguments[2])else {
                    return false
            }
            return validate(slot: firstArgument, currentSlotSize: currentSlotSize) &&
                validate(slot: secondArgument, currentSlotSize: currentSlotSize)
        case .size, .add, .rm, .replay, .undo:
            guard arguments.count == 2, let firstArgument = Int(arguments[1]) else {
                return false
            }
            return validate(slot: firstArgument, currentSlotSize: currentSlotSize)
        case .help, .exit, .print:
            return arguments.count == 1
        }
    }
    
    internal func validate(slot: Int, currentSlotSize: Int) -> Bool {
        return slot >= 0 && slot < currentSlotSize
    }
}
