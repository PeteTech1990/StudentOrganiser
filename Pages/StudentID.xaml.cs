using static System.Net.WebRequestMethods;
using System.Net.Http;
using System.Runtime.InteropServices.Marshalling;
using System;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using IImage = Microsoft.Maui.Graphics.IImage;
using Microsoft.Maui.Graphics.Platform;

namespace StudentOrganiser.Pages;

public partial class StudentID : ContentPage
{
    private readonly string apiURL = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&format=png&data=";
    private string myID = "22116948";

    public StudentID()
    {
        InitializeComponent();
        RetrieveQrCode();


    }

    public async void RetrieveQrCode()
    {
        if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
        {
            await DisplayAlert("No connection", "QR Code could not be generated, no internet access", "OK");
        }

        else
        {            

            qrCode.Source = new Uri($"{apiURL}{EncryptID()}");

        }
    }

    public string EncryptID()
    {
        string iDStringToEncrypt = myID + DateTime.Now.ToString("O");

        return iDStringToEncrypt;

    }

    public void RefreshQrCode(object sender, EventArgs e)
    {
        RetrieveQrCode();
    }

}