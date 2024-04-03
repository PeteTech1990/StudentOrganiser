using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;
using StudentOrganiser.Classes;
using StudentOrganiser.Pages;
using Plugin.Maui.Audio;

namespace StudentOrganiser
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .UseMauiCommunityToolkitMediaElement()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                })
                .UseMauiMaps();

#if DEBUG
    		builder.Logging.AddDebug();

            string dbPath = FileSystem.AppDataDirectory + "/studentOrgDB.db3";
            builder.Services.AddSingleton<DBConnect>(s => ActivatorUtilities.CreateInstance<DBConnect>(s, dbPath));

            builder.Services.AddSingleton(AudioManager.Current);
            builder.Services.AddTransient<AddAudioToNoteModal>();
#endif

            return builder.Build();
        }
    }
}
