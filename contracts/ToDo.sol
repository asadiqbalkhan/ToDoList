// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract ToDo{
    // struct for Task 
    struct Task {
        uint id;
        uint date;
        string content;
        string author;
        bool done;
    }
// way of representation a collection of task
// create a dynamic array 
Task[] tasks;

event TaskCreated(
    uint id, 
    uint date,
    string content, 
    string author, 
    bool done
);


// function to create a task
    function createTask(string memory _content, string memory _author) public {
        // tasks.length = first task added in the dynamic array which at creation should be 0
        // now || block.timestamp to get the date of the task created
        // upon creation set boolean to false as no task has been added prior to the execution
        tasks.push(Task(tasks.length, block.timestamp, _content, _author, false));
        emit TaskCreated(tasks.length, block.timestamp, _content, _author, false);

    }

    function getTask(uint id) public view returns(
        uint, 
        uint, 
        string memory,
        string memory, 
        bool
    ){
        // body of the function
        return (
            id,
            tasks[id].date,
            tasks[id].content,
            tasks[id].author,
            tasks[id].done 
        );
    }

    function getTaskFixtures(uint _id) public view returns(
        uint, 
        uint,
        string memory,
        string memory,
        bool
    ){
        return (0, block.timestamp, "Hello blockchain", "Asad", false);
    }

    function getTasks() public view returns(Task[] memory){
        return tasks;
    }


    
}