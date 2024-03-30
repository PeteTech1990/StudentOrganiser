
using Microsoft.Maui.Maps;
using Map = Microsoft.Maui.Controls.Maps.Map;

namespace StudentOrganiser.Pages;

public partial class CampusMap : ContentPage
{
	public CampusMap()
	{
		InitializeComponent();

		Location colegCambria = new Location(53.0493641, -2.9940729);
		MapSpan mapSpan = new MapSpan(colegCambria, 0.01, 0.01);
		this.colegCambriaMap = new Map(mapSpan);
	}
}