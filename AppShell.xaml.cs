using StudentOrganiser.Pages;

namespace StudentOrganiser
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute("tododetailspage", typeof(Pages.TaskDetails));
        }
    }
}
