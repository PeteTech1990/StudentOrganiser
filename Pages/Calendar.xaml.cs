using StudentOrganiser.Classes;
using System.Globalization;

namespace StudentOrganiser.Pages;

public partial class Calendar : ContentPage
{

	private int selectedYear;
	private int selectedMonth;

	public Calendar()
	{
		InitializeComponent();
		App.databaseConnector.PopulateLessons();
		BuildCalendar(DateTime.Today);
		selectedMonth = DateTime.Today.Month;
		selectedYear = DateTime.Today.Year;

		PopulateLessons();
		//DisplayToday();
	}

	//LessonClick event

	//prevMonthCLick event

	//NextMonthClick event

	private void BuildCalendar(DateTime currentCalendarMonth)
	{
        //https://stackoverflow.com/questions/6286868/convert-month-int-to-month-name
        currentMonth.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(currentCalendarMonth.Month);

		int numDays = DateTime.DaysInMonth(currentCalendarMonth.Year, currentCalendarMonth.Month);

		for (int i = 0; i < numDays; i++)
		{
			ColumnDefinition dayColumn = new ColumnDefinition();
			Border dayBorder = new Border();
			dayBorder.Stroke = Color.FromRgb(0, 0, 0);
			Label dayLabel = new Label();
			dayLabel.Text = (i + 1).ToString();
			dayLabel.FontSize = 15;
			dayLabel.WidthRequest = 100;
			dayBorder.Content = dayLabel;
			CalendarGrid.ColumnDefinitions.Add(dayColumn);
			CalendarGrid.SetRow(dayBorder, 0);
			CalendarGrid.SetColumn(dayBorder, i + 1);
			CalendarGrid.Children.Add(dayBorder);
		}
	}

	public async void PopulateLessons()
	{
		List<Lesson> lessonForThisMonth = await App.databaseConnector.GetLessonsForMonth(selectedMonth, selectedYear);

		foreach (Lesson lesson in lessonForThisMonth)
		{
            
            Border lessonBorder = new Border();
            lessonBorder.Stroke = Color.FromRgb(0, 0, 0);
			lessonBorder.BackgroundColor = App.databaseConnector.GetSubjectColour(lesson.GetSubjectID());
            Label lessonLabel = new Label();
            lessonLabel.Text = lesson.GetTitle();
			lessonLabel.AutomationId = lesson.GetID().ToString();
            lessonLabel.FontSize = 15;
			lessonLabel.TextColor = Color.FromRgb(255, 255, 255);
            lessonLabel.WidthRequest = 100;
            lessonBorder.Content = lessonLabel;
            CalendarGrid.SetRow(lessonBorder, (lesson.GetTimePeriod() + 1));
            CalendarGrid.SetColumn(lessonBorder, lesson.GetDate().Day);
            CalendarGrid.Children.Add(lessonBorder);
        }
		//await App.databaseConnector.PopulateLessons();
	}
}