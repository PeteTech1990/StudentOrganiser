
using System.IO;
using Plugin.Maui.Audio;

namespace StudentOrganiser.Pages;

public partial class AddAudioToNoteModal : ContentPage
{
	readonly IAudioManager _audioManager;
	readonly IAudioRecorder _audioRecorder;
	IAudioSource recording;
	private int noteID;

	public AddAudioToNoteModal(IAudioManager audioManager, int noteID)
	{
		InitializeComponent();

		_audioManager = audioManager;
		_audioRecorder = audioManager.CreateRecorder();
		this.noteID = noteID;
	}

    private async void RecordAudio(object sender, EventArgs e)
    {
		if (await Permissions.RequestAsync<Permissions.Microphone>() == PermissionStatus.Granted)
		{
			if (!_audioRecorder.IsRecording)
			{
				this.Record.Text = "⏹";
				await _audioRecorder.StartAsync(FileSystem.AppDataDirectory + $"/{noteID}");
			}
			else
			{
				this.Record.Text = "⏺";
				var record = await _audioRecorder.StopAsync();
				recording = (IAudioSource)record;
			}
		}
    }

    private void PlaybackAudio(object sender, EventArgs e)
    {
		
        var player = AudioManager.Current.CreatePlayer(recording.GetAudioStream());
		player.Volume = 0.7f;
		player.Play();
    }

    private void ResetAudio(object sender, EventArgs e)
    {
		recording = null;
    }

    private async void SaveAudioFile(object sender, EventArgs e)
    {
		await Navigation.PopModalAsync();
    }
}