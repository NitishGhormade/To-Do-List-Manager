#!/bin/bash

# File to store tasks
TODO_FILE="todo_list.txt"

# Function to display the menu
show_menu() {
  echo "======================="
  echo "   To-Do List Manager  "
  echo "======================="
  echo "1. Add Task"
  echo "2. View Tasks"
  echo "3. Delete Task"
  echo "4. Exit"
}

# Function to add a task
add_task() {
  read -p "Enter the task: " task
  if [[ -n "$task" ]]; then
    echo "$task" >> "$TODO_FILE"
    echo "Task added successfully!"
  else
    echo "Task cannot be empty!"
  fi
}

# Function to view tasks
view_tasks() {
  if [[ -f "$TODO_FILE" && -s "$TODO_FILE" ]]; then
    echo "Your Tasks:"
    nl -w2 -s'. ' "$TODO_FILE"
  else
    echo "No tasks found!"
  fi
}

# Function to delete a task
delete_task() {
  if [[ -f "$TODO_FILE" && -s "$TODO_FILE" ]]; then
    view_tasks
    read -p "Enter the task number to delete: " task_num
    if [[ $task_num =~ ^[0-9]+$ ]]; then
      sed -i "${task_num}d" "$TODO_FILE" 2>/dev/null
      echo "Task deleted successfully!"
    else
      echo "Invalid input! Please enter a number."
    fi
  else
    echo "No tasks to delete!"
  fi
}

# Main script loop
while true; do
  show_menu
  read -p "Choose an option: " choice
  case $choice in
    1) add_task ;;
    2) view_tasks ;;
    3) delete_task ;;
    4) echo "Goodbye!"; break ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done
