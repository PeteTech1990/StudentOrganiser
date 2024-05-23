﻿
using CommunityToolkit.Maui.Views;
using Microsoft.Extensions.Logging.Abstractions;
using System.Collections.Specialized;
using System.Text;
using static SQLite.SQLite3;

namespace StudentOrganiser.Pages;

public partial class AddVideoToNoteModal : ContentPage
{

	private string noteID;
	private string filePath;

    public AddVideoToNoteModal(string noteID)
	{
		InitializeComponent();

		this.noteID = noteID;
		

    }

    private void AddVideoToNoteModal_Appearing(object? sender, EventArgs e)
    {
        throw new NotImplementedException();
    }

    private async void SaveVideoFile(object sender, EventArgs e)
	{
		await Navigation.PopModalAsync();
	}

	private async void AddLocalVideo(object sender, EventArgs e)
	{

		filePath = await GetVideoPath();

        if (filePath != null)
        {

            if (await Permissions.RequestAsync<Permissions.StorageWrite>() == PermissionStatus.Granted)
            {
                File.Copy(filePath, FileSystem.AppDataDirectory + $"/{noteID}.mp4", true);
            }
        }


        if (File.Exists(FileSystem.AppDataDirectory + $"/{noteID}.mp4"))
        {
            this.videoPlayer.Source = FileSystem.AppDataDirectory + $"/{noteID}.mp4";
        }


    }

	private async Task<string?> GetVideoPath()
	{
        if (await Permissions.RequestAsync<Permissions.StorageRead>() == PermissionStatus.Granted)
        {
            var videoFile = await FilePicker.Default.PickAsync();
			return videoFile.FullPath.ToString();
        }

		else
		{
			return null;
		}
    }


    private async void AddYoutubeVideo(object sender, EventArgs e)
    {
		string? result = null;

        try
        {
            result = await GetYoutubeURL();




            if (result != null)
            {

                if (await Permissions.RequestAsync<Permissions.StorageWrite>() == PermissionStatus.Granted)
                {
                    string filePath = FileSystem.AppDataDirectory + $"/{noteID}.txt";

                    File.CreateText(filePath).Dispose();

                    await File.WriteAllTextAsync(FileSystem.AppDataDirectory + $"/{noteID}.txt", result);


                }

                if (File.Exists(FileSystem.AppDataDirectory + $"/{noteID}.txt"))
                {
                    WebView youtubeVideoViewer = new WebView();
                    youtubeVideoViewer.Source = File.ReadAllText(FileSystem.AppDataDirectory + $"/{noteID}.txt");
                    youtubeVideoViewer.HeightRequest = 250;
                    this.MediaView.Content = youtubeVideoViewer;


                }
            }
        }
        catch (Exception ex)
        {

        }


        
    }

    private async Task<string?> GetYoutubeURL()
    {
        string result = await DisplayPromptAsync("Youtube URL", "Paste a Youtube URL");
        if (result == null || result == "")
        {
            throw new Exception("URL value cannot be blank. Please enter a URL");
        }
        else if (result.Length > 100)
        {
            throw new Exception("URL value cannot be longer than 100 characters. Please enter a shorter URL");
        }
        else if (!result.Contains("www.youtube.com/embed"))
        {
            throw new Exception("URL must be a valid YouTube embed URL. Please enter an embed URL");
        }
        else
        {
            return result;
        }
    }
}