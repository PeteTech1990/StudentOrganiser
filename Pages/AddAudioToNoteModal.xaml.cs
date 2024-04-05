
using System.IO;
using Plugin.Maui.Audio;

namespace StudentOrganiser.Pages;

public partial class AddAudioToNoteModal : ContentPage
{
	readonly IAudioManager _audioManager;
	private IAudioRecorder _audioRecorder;
	private AsyncAudioPlayer _audioPlayer;
	private IAudioSource recording = null;
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
				await _audioRecorder.StartAsync(FileSystem.AppDataDirectory + $"/{noteID}.mp3");
			}
			else
			{
				this.Record.Text = "⏺";
				recording = await _audioRecorder.StopAsync();
			}
		}
    }

    private async void PlaybackAudio(object sender, EventArgs e)
    {
		if (_audioPlayer == null && recording != null)
			_audioPlayer = AudioManager.Current.CreateAsyncPlayer(recording.GetAudioStream());
		else if (_audioPlayer != null)
		{
			if (_audioPlayer.IsPlaying)
			{
				_audioPlayer.Stop();
			}
			else
			{
				
				await _audioPlayer.PlayAsync(CancellationToken.None);
			}
		}
    }

    private void ResetAudio(object sender, EventArgs e)
    {
		recording = null;
		_audioPlayer = null;
    }

    private async void SaveAudioFile(object sender, EventArgs e)
    {
		if (_audioPlayer != null) _audioPlayer.Dispose();
		
		await Navigation.PopModalAsync();
    }
}