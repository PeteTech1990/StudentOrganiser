namespace StudentOrganiser.Pages
{
    public partial class ToDoList : ContentPage
    {
        int taskIDCount = 0;
        List<TodoTaskView> todoTasks = new List<TodoTaskView>();

        public ToDoList()
        {
            InitializeComponent();
            

            AddTask.Clicked += NewTask;
            //Counter.Clicked -= OnCounterClicked; To Unsubscribe
        }

        private void NewTask(object sender, EventArgs e)
        {
            TodoTaskView newTask = new TodoTaskView("Clean the Fridge", true, "Remove all the mould, throw old food", "Food Studies", DateTime.Now.AddDays(7), this, taskIDCount);
            this.allTasks.Children.Add(newTask.GetView());
            todoTasks.Add(newTask);
            taskIDCount++;
            
        }

        public void ClearTask(int idToClear)
        {
            //for (int i = 0; i<this.allTasks.Children.Count;i++)
            //{
            //    TodoTaskView task = (TodoTaskView)this.allTasks.Children[i];

            //    if(task.GetID() == idToClear)
            //    {
            //        this.allTasks.Children.RemoveAt(i);

            //    }
            //}

            int indexNo = 0;

            foreach (TodoTaskView task in todoTasks)
            {
                if(task.GetID() == idToClear)
                {
                    this.allTasks.Children.RemoveAt(indexNo);
                    todoTasks.RemoveAt(indexNo);
                    break;
                }
                indexNo++;
            }
        }

        
    }

}
