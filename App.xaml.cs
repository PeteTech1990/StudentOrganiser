using StudentOrganiser.Classes;

namespace StudentOrganiser
{
    public partial class App : Application
    {
        //https://learn.microsoft.com/en-us/training/modules/store-local-data/4-exercise-store-data-locally-with-sqlite
        public static DBConnect databaseConnector { get; private set; }

        public App(DBConnect dBConnect)
        {
            InitializeComponent();

            MainPage = new AppShell();

            databaseConnector = dBConnect;
        }
    }
}
