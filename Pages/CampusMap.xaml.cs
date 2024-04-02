
using Microsoft.Maui.Controls.Maps;
using Microsoft.Maui.Maps;
using StudentOrganiser.Classes;
using System.Collections.ObjectModel;
using Map = Microsoft.Maui.Controls.Maps.Map;

namespace StudentOrganiser.Pages;

public partial class CampusMap : ContentPage
{

	private ObservableCollection<MapLocation> mapLocations = new ObservableCollection<MapLocation>();
	private ObservableCollection<MapLocation> MapLocations {get { return mapLocations;}}
	
	private int locationID = 0;
	private MapLocation selectedDestination;
	private Map colegCambriaMap;

    public CampusMap()
	{
		InitializeComponent();
		BindingContext = this;
		PopulateMapLocations();

		allLocations.ItemsSource = mapLocations;		
		allLocations.ItemDisplayBinding = new Binding("label");

		Location colegCambria = new Location(53.04937625507666, -2.9933496751370536);
		MapSpan mapSpan = new MapSpan(colegCambria, 0.002, 0.002);
		colegCambriaMap = new Map(mapSpan);
		
		colegCambriaMap.HeightRequest = 570;
		colegCambriaMap.IsShowingUser = true;
		colegCambriaMap.IsZoomEnabled = false;
		colegCambriaMap.IsScrollEnabled = false;
		colegCambriaMap.MapType = MapType.Hybrid;
		this.MapLayout.Children.Add(colegCambriaMap);

		Geolocation.LocationChanged += Geolocation_LocationChanged;

	}

	private void PopulateMapLocations()	
	{
		mapLocations = App.databaseConnector.GetAllLocations();
	}

	private async void LocationSelected(object sender, EventArgs e)
	{
		Geolocation.StopListeningForeground();

		foreach (MapLocation location in mapLocations)
		{
			if(location.GetID() == ((MapLocation)allLocations.SelectedItem).GetID())
			{
				selectedDestination = location;
			}
		}

		Pin destination = new Pin
		{
			Label = selectedDestination.GetLabel(),
			Address = selectedDestination.GetAddress(),
			Type = PinType.Place,
			Location = selectedDestination.GetLocation()
		
		};

		colegCambriaMap.Pins.Add(destination);

		Polyline navRoute = new Polyline
		{
			StrokeColor = Colors.Green,
			StrokeWidth = 12,
			Geopath =
			{
				await Geolocation.Default.GetLastKnownLocationAsync(),
				selectedDestination.GetLocation()
			}
		};

		colegCambriaMap.MapElements.Add(navRoute);

		navInfo.Text = $"Navigating to: {selectedDestination.GetAddress()}";

        var request = new GeolocationListeningRequest(GeolocationAccuracy.High);
        await Geolocation.StartListeningForegroundAsync(request);

    }

	private async void Geolocation_LocationChanged(object sender, GeolocationLocationChangedEventArgs e)
	{
		colegCambriaMap.MapElements.Clear();
		colegCambriaMap.Pins.Clear();

        Polyline navRoute = new Polyline
        {
            StrokeColor = Colors.Green,
            StrokeWidth = 12,
            Geopath =
            {
                e.Location,
                selectedDestination.GetLocation()
            }
        };

        colegCambriaMap.MapElements.Add(navRoute);
        
		var request = new GeolocationListeningRequest();
        await Geolocation.StartListeningForegroundAsync(request);
    }
}