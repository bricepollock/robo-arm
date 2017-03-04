//
//  ArmCommands+validate.swift
//  roboArm
//
//  Created by Brice Pollock on 3/3/17.
//  Copyright © 2017 Brice Pollock. All rights reserved.
//

import XCTest

class ArmCommands_validate: XCTestCase {
    let defaultSlotSize = 3
    
    func testArmCommandValidation_invalidArg_int() {
        let command: ArmCommands = .size
        let input = ["1"]
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_invalidArg_string() {
        let command: ArmCommands = .size
        let input = ["climb"]
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_invalidArg_process() {
        let command: ArmCommands = .size
        let input = ["./roboArm"]
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: size
    func testArmCommandValidation_size() {
        let command: ArmCommands = .size
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_size_string() {
        let command: ArmCommands = .size
        let params: [String] = ["climb"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_size_numArgs() {
        let command: ArmCommands = .size
        let params: [String] = ["1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_size_zero() {
        let command: ArmCommands = .size
        let params: [String] = ["0"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_size_outOfBound_negative() {
        let command: ArmCommands = .size
        let params: [String] = ["-1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: add
    func testArmCommandValidation_add() {
        let command: ArmCommands = .add
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_add_string() {
        let command: ArmCommands = .add
        let params: [String] = ["climb"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_add_numArgs() {
        let command: ArmCommands = .add
        let params: [String] = ["1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_add_zero() {
        let command: ArmCommands = .add
        let params: [String] = ["0"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_add_outOfBound_negative() {
        let command: ArmCommands = .add
        let params: [String] = ["-1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_add_outOfBound_higher() {
        let command: ArmCommands = .add
        let params: [String] = ["10"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: rm
    func testArmCommandValidation_rm() {
        let command: ArmCommands = .rm
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_rm_string() {
        let command: ArmCommands = .rm
        let params: [String] = ["climb"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_rm_numArgs() {
        let command: ArmCommands = .rm
        let params: [String] = ["1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_rm_zero() {
        let command: ArmCommands = .rm
        let params: [String] = ["0"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_rm_outOfBound_negative() {
        let command: ArmCommands = .rm
        let params: [String] = ["-1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_rm_outOfBound_higher() {
        let command: ArmCommands = .rm
        let params: [String] = ["10"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: replay
    func testArmCommandValidation_replay() {
        let command: ArmCommands = .replay
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_replay_string() {
        let command: ArmCommands = .replay
        let params: [String] = ["climb"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_replay_numArgs() {
        let command: ArmCommands = .replay
        let params: [String] = ["1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_replay_zero() {
        let command: ArmCommands = .replay
        let params: [String] = ["0"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_replay_outOfBound_negative() {
        let command: ArmCommands = .replay
        let params: [String] = ["-1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_replay_outOfBound_higher() {
        let command: ArmCommands = .replay
        let params: [String] = ["10"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: undo
    func testArmCommandValidation_undo() {
        let command: ArmCommands = .undo
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_undo_string() {
        let command: ArmCommands = .undo
        let params: [String] = ["climb"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_undo_numArgs() {
        let command: ArmCommands = .undo
        let params: [String] = ["1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_undo_zero() {
        let command: ArmCommands = .undo
        let params: [String] = ["0"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_undo_outOfBound_negative() {
        let command: ArmCommands = .undo
        let params: [String] = ["-1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_undo_outOfBound_higher() {
        let command: ArmCommands = .undo
        let params: [String] = ["10"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    //MARK: mv
    
    func testArmCommandValidation_mv() {
        let command: ArmCommands = .mv
        let params: [String] = ["1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_first_string() {
        let command: ArmCommands = .mv
        let params: [String] = ["climb", "1'"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_second_string() {
        let command: ArmCommands = .mv
        let params: [String] = ["1", "climb"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_both_string() {
        let command: ArmCommands = .mv
        let params: [String] = ["climb", "higher"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_numArgs_less() {
        let command: ArmCommands = .mv
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_numArgs_more() {
        let command: ArmCommands = .mv
        let params: [String] = ["1", "2", "1", "2"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_zero() {
        let command: ArmCommands = .mv
        let params: [String] = ["1", "0"]
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_outOfBound_negative() {
        let command: ArmCommands = .mv
        let params: [String] = ["1", "-1"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_mv_outOfBound_higher() {
        let command: ArmCommands = .mv
        let params: [String] = ["1", "10"]
        let input = [command.rawValue] + params
        
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: help
    
    func testArmCommandValidation_help() {
        let command: ArmCommands = .help
        let params: [String] = []
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_help_numArgs() {
        let command: ArmCommands = .help
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))        
    }
    
    // MARK: help
    
    func testArmCommandValidation_exit() {
        let command: ArmCommands = .exit
        let params: [String] = []
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_exit_numArgs() {
        let command: ArmCommands = .exit
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    // MARK: print
    
    func testArmCommandValidation_print() {
        let command: ArmCommands = .print
        let params: [String] = []
        let input = [command.rawValue] + params
        
        XCTAssertTrue(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
    
    func testArmCommandValidation_print_numArgs() {
        let command: ArmCommands = .print
        let params: [String] = ["1"]
        let input = [command.rawValue] + params
        XCTAssertFalse(command.validate(arguments: input, currentSlotSize: defaultSlotSize))
    }
}
