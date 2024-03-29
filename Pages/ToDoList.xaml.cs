using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages
{
    public partial class ToDoList : ContentPage
    {
        int taskIDCount = 0;
        //AllTasks allToDos = new AllTasks();
        List<TodoTaskView> todoTaskViews = new List<TodoTaskView>();

        public ToDoList()
        {
            InitializeComponent();
            

            AddTask.Clicked += NewTask;
            //Counter.Clicked -= OnCounterClicked; To Unsubscribe
        }

        private void NewTask(object sender, EventArgs e)
        {
            ToDoListTask newTask = new ToDoListTask("Clean the Fridge", true, "Remove all the mould, throw old food", "Food Studies", DateTime.Now.AddDays(7), taskIDCount);
            AllTasks.AddTask(newTask);
            TodoTaskView newTaskView = new TodoTaskView(this, newTask);
            this.allTasks.Children.Add(newTaskView.GetView());
            todoTaskViews.Add(newTaskView);
            taskIDCount++;
            
        }

        public void ClearTask(int idToClear)
        {

            int indexNo = 0;

            foreach (TodoTaskView task in todoTaskViews)
            {
                if(task.GetTaskID() == idToClear)
                {
                    AllTasks.RemoveTask(task.GetTaskID());
                    this.allTasks.Children.RemoveAt(indexNo);
                    todoTaskViews.RemoveAt(indexNo);
                    break;
                }
                indexNo++;
            }
        }

        
    }

}
