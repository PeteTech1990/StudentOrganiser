using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages
{
    public partial class ToDoList : ContentPage
    {
        
        //AllTasks allToDos = new AllTasks();
        List<TodoTaskView> todoTaskViews = new List<TodoTaskView>();

        public ToDoList()
        {
            InitializeComponent();

            GetAllTasks();

            AddTask.Clicked += NewTask;
            this.NavigatedTo += NavToEvent;
            //Counter.Clicked -= OnCounterClicked; To Unsubscribe
        }

        private async void NewTask(object sender, EventArgs e)
        {
            await Navigation.PushModalAsync(new AddTaskModal());

            
        }

        public async void GetAllTasks()
        {
            List<ToDoListTask> allToDoTasks = await App.databaseConnector.GetAllToDoListTasks();

            this.allTasks.Children.Clear();
            todoTaskViews.Clear();

            foreach (ToDoListTask task in allToDoTasks)
            {
                TodoTaskView newTaskView = new TodoTaskView(this, task);
                this.allTasks.Children.Add(newTaskView.GetView());
                todoTaskViews.Add(newTaskView);
            }


        }

        private void NavToEvent(object sender, NavigatedToEventArgs e)
        {
            GetAllTasks();
        }

        public async void ClearTask(int idToClear)
        {

            int indexNo = 0;

            foreach (TodoTaskView task in todoTaskViews)
            {
                if(task.GetTaskID() == idToClear)
                {
                    await App.databaseConnector.RemoveTaskFromDatabase(idToClear);
                    this.allTasks.Children.RemoveAt(indexNo);
                    todoTaskViews.RemoveAt(indexNo);
                    break;
                }
                indexNo++;
            }
        }

        
    }

}
