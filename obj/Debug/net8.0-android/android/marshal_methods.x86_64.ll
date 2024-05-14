; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [371 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [742 x i64] [
	i64 15690660930947125, ; 0: Microsoft.DotNet.PlatformAbstractions.dll => 0x37be92af148835 => 179
	i64 24362543149721218, ; 1: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 273
	i64 36418902923615093, ; 2: Plugin.LocalNotification => 0x8162cc9bdf1b75 => 222
	i64 98382396393917666, ; 3: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 211
	i64 120698629574877762, ; 4: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 5: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 217
	i64 160518225272466977, ; 6: Microsoft.Extensions.Hosting.Abstractions => 0x23a4679b5576e21 => 201
	i64 196720943101637631, ; 7: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 8: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 260
	i64 229794953483747371, ; 9: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 10: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 302
	i64 295915112840604065, ; 11: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 305
	i64 316157742385208084, ; 12: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 267
	i64 350667413455104241, ; 13: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 354178770117062970, ; 14: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0x4ea4bb703cff13a => 210
	i64 422779754995088667, ; 15: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 16: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 304
	i64 435170709725415398, ; 17: Xamarin.GooglePlayServices.Location => 0x60a097471d687e6 => 326
	i64 560278790331054453, ; 18: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 590337075967009532, ; 19: Microsoft.Maui.Maps.dll => 0x8314c715ec1a2fc => 219
	i64 634308326490598313, ; 20: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 286
	i64 648449422406355874, ; 21: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 191
	i64 649145001856603771, ; 22: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 668723562677762733, ; 23: Microsoft.Extensions.Configuration.Binder.dll => 0x947c88986577aad => 188
	i64 687654259221141486, ; 24: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 324
	i64 750875890346172408, ; 25: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 26: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 261
	i64 799765834175365804, ; 27: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 805302231655005164, ; 28: hu\Microsoft.Maui.Controls.resources.dll => 0xb2d021ceea03bec => 348
	i64 870603111519317375, ; 29: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 228
	i64 872800313462103108, ; 30: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 272
	i64 895210737996778430, ; 31: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 287
	i64 940822596282819491, ; 32: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 943650302560566006, ; 33: ExoPlayer.Dash.dll => 0xd1884f3544ffaf6 => 235
	i64 960778385402502048, ; 34: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 1010599046655515943, ; 35: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1042284010116954804, ; 36: Infra.SqliteBrowser => 0xe76efc8f2173ab4 => 221
	i64 1120440138749646132, ; 37: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 317
	i64 1216327008498411975, ; 38: Infra.Sqlite => 0x10e142f84842e9c7 => 220
	i64 1268860745194512059, ; 39: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1301485588176585670, ; 40: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 227
	i64 1301626418029409250, ; 41: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 42: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 256
	i64 1369545283391376210, ; 43: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 295
	i64 1404195534211153682, ; 44: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 45: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 46: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 47: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 213
	i64 1492954217099365037, ; 48: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 49: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1518315023656898250, ; 50: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 229
	i64 1537168428375924959, ; 51: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1576750169145655260, ; 52: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 316
	i64 1624659445732251991, ; 53: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 255
	i64 1628611045998245443, ; 54: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 290
	i64 1636321030536304333, ; 55: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 280
	i64 1651782184287836205, ; 56: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 57: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1672383392659050004, ; 58: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 178
	i64 1682513316613008342, ; 59: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1735388228521408345, ; 60: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 61: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 62: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 63: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 254
	i64 1825687700144851180, ; 64: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 65: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 342
	i64 1836611346387731153, ; 66: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 302
	i64 1854145951182283680, ; 67: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1865037103900624886, ; 68: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 177
	i64 1875417405349196092, ; 69: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 70: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 251
	i64 1881198190668717030, ; 71: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 364
	i64 1897575647115118287, ; 72: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 304
	i64 1920760634179481754, ; 73: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 215
	i64 1972385128188460614, ; 74: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 75: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 288
	i64 1996473713535492147, ; 76: CommunityToolkit.Maui.MediaElement.dll => 0x1bb4e643c2b02033 => 175
	i64 2040001226662520565, ; 77: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 78: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 79: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 332
	i64 2080945842184875448, ; 80: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 81: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 82: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2165310824878145998, ; 83: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 248
	i64 2165725771938924357, ; 84: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 258
	i64 2192948757939169934, ; 85: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 181
	i64 2200176636225660136, ; 86: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 206
	i64 2262844636196693701, ; 87: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 272
	i64 2287834202362508563, ; 88: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 89: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2304837677853103545, ; 90: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 301
	i64 2315304989185124968, ; 91: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2329709569556905518, ; 92: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 283
	i64 2335503487726329082, ; 93: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 94: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2379805940701141695, ; 95: ExoPlayer.Rtsp => 0x2106c4e4f1db1abf => 241
	i64 2470498323731680442, ; 96: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 265
	i64 2479423007379663237, ; 97: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 311
	i64 2497223385847772520, ; 98: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 99: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 249
	i64 2592350477072141967, ; 100: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 101: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 363
	i64 2624866290265602282, ; 102: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 103: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 104: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 194
	i64 2662981627730767622, ; 105: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 338
	i64 2706075432581334785, ; 106: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2783046991838674048, ; 107: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 108: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 306
	i64 2815524396660695947, ; 109: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2895129759130297543, ; 110: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 343
	i64 2897279701402357900, ; 111: Microsoft.Extensions.Hosting => 0x28353489b909908c => 200
	i64 2923871038697555247, ; 112: Jsr305Binding => 0x2893ad37e69ec52f => 318
	i64 3017136373564924869, ; 113: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 114: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 317
	i64 3106852385031680087, ; 115: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 116: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 117: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3168817962471953758, ; 118: Microsoft.Extensions.Hosting.Abstractions.dll => 0x2bf9e725d304955e => 201
	i64 3188824379904900412, ; 119: ExoPlayer.Common.dll => 0x2c40fae0df563d3c => 232
	i64 3281594302220646930, ; 120: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 121: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 281
	i64 3293991522576715523, ; 122: Microsoft.Extensions.Logging.EventLog => 0x2db69bd664554f03 => 207
	i64 3303437397778967116, ; 123: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 252
	i64 3311221304742556517, ; 124: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 125: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 126: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 127: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 335
	i64 3396143930648122816, ; 128: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 197
	i64 3411255996856937470, ; 129: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 325
	i64 3429672777697402584, ; 130: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 217
	i64 3437845325506641314, ; 131: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 132: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 308
	i64 3494946837667399002, ; 133: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 186
	i64 3508450208084372758, ; 134: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 135: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 307
	i64 3523004241079211829, ; 136: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 185
	i64 3531994851595924923, ; 137: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 138: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 139: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 358
	i64 3571415421602489686, ; 140: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 141: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 187
	i64 3647754201059316852, ; 142: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 143: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 186
	i64 3659371656528649588, ; 144: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 246
	i64 3716579019761409177, ; 145: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 146: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 300
	i64 3772598417116884899, ; 147: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 273
	i64 3869221888984012293, ; 148: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 202
	i64 3869649043256705283, ; 149: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3889433610606858880, ; 150: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 198
	i64 3890352374528606784, ; 151: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 215
	i64 3919223565570527920, ; 152: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 153: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 154: System.Memory => 0x370b03412596249e => 62
	i64 4006972109285359177, ; 155: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 156: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4070326265757318011, ; 157: da\Microsoft.Maui.Controls.resources.dll => 0x387cb42c56683b7b => 339
	i64 4073500526318903918, ; 158: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 159: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 212
	i64 4120493066591692148, ; 160: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 369
	i64 4148881117810174540, ; 161: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 162: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 163: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 164: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 165: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 166: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 267
	i64 4205801962323029395, ; 167: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4235503420553921860, ; 168: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4247996603072512073, ; 169: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 328
	i64 4282138915307457788, ; 170: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4321865999928413850, ; 171: System.Diagnostics.EventLog.dll => 0x3bfa5a3a8c924e9a => 230
	i64 4337444564132831293, ; 172: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 226
	i64 4360412976914417659, ; 173: tr\Microsoft.Maui.Controls.resources.dll => 0x3c834c8002fcc7fb => 364
	i64 4373617458794931033, ; 174: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4397634830160618470, ; 175: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4418670123468915552, ; 176: Microsoft.Extensions.Logging.Console.dll => 0x3d524510f0ff0360 => 205
	i64 4477672992252076438, ; 177: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 178: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4513320955448359355, ; 179: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 182
	i64 4533124835995628778, ; 180: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4612482779465751747, ; 181: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 181
	i64 4636684751163556186, ; 182: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 312
	i64 4672453897036726049, ; 183: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4716677666592453464, ; 184: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 185: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4754620528327149104, ; 186: Microsoft.Extensions.Logging.Console => 0x41fbce2df0b84630 => 205
	i64 4759461199762736555, ; 187: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 285
	i64 4794310189461587505, ; 188: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 249
	i64 4795410492532947900, ; 189: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 307
	i64 4809057822547766521, ; 190: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 191: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 192: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 4871824391508510238, ; 193: nb\Microsoft.Maui.Controls.resources.dll => 0x439c3278d7f2c61e => 354
	i64 4953714692329509532, ; 194: sv\Microsoft.Maui.Controls.resources.dll => 0x44bf21444aef129c => 362
	i64 5055365687667823624, ; 195: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 250
	i64 5081566143765835342, ; 196: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 197: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 198: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5129462924058778861, ; 199: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 178
	i64 5182934613077526976, ; 200: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 201: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 292
	i64 5244375036463807528, ; 202: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 203: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5272717148637201210, ; 204: ExoPlayer.UI => 0x492c744f85a1833a => 244
	i64 5278787618751394462, ; 205: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 206: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 284
	i64 5290786973231294105, ; 207: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5348796042099802469, ; 208: Xamarin.AndroidX.Media => 0x4a3abda9415fc165 => 293
	i64 5376510917114486089, ; 209: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 311
	i64 5389233738419247641, ; 210: ExoPlayer.UI.dll => 0x4aca67881e079a19 => 244
	i64 5408338804355907810, ; 211: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 309
	i64 5423376490970181369, ; 212: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 213: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 214: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 215: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 263
	i64 5457765010617926378, ; 216: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 217: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 362
	i64 5507995362134886206, ; 218: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 219: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 365
	i64 5527431512186326818, ; 220: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5528247634813456972, ; 221: Plugin.LocalNotification.dll => 0x4cb847ef1773124c => 222
	i64 5552873915470424749, ; 222: Microsoft.Extensions.Logging.EventLog.dll => 0x4d0fc567de25aaad => 207
	i64 5570799893513421663, ; 223: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 224: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5573669443803475672, ; 225: Microsoft.Maui.Controls.Maps => 0x4d59a6d41d5aeed8 => 214
	i64 5574231584441077149, ; 226: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 253
	i64 5591791169662171124, ; 227: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5626675072969102346, ; 228: SQLitePCLRaw.nativelibrary.dll => 0x4e15f72adede540a => 225
	i64 5650097808083101034, ; 229: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 230: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 314
	i64 5703838680789880885, ; 231: ExoPlayer.SmoothStreaming.dll => 0x4f281b0f589d1035 => 242
	i64 5724799082821825042, ; 232: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 276
	i64 5757522595884336624, ; 233: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 262
	i64 5783556987928984683, ; 234: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 235: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 282
	i64 5959344983920014087, ; 236: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 303
	i64 5979151488806146654, ; 237: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 238: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6102788177522843259, ; 239: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 303
	i64 6175278734029192665, ; 240: Microsoft.Extensions.Configuration.CommandLine => 0x55b2ff4a62d57dd9 => 189
	i64 6183170893902868313, ; 241: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 226
	i64 6200764641006662125, ; 242: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 359
	i64 6222399776351216807, ; 243: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 244: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 245: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 246: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6300676701234028427, ; 247: es\Microsoft.Maui.Controls.resources.dll => 0x57708013cda25f8b => 342
	i64 6313127126423224581, ; 248: ExoPlayer.DataSource => 0x579cbbac5056c105 => 237
	i64 6319713645133255417, ; 249: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 286
	i64 6357457916754632952, ; 250: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 370
	i64 6401687960814735282, ; 251: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 283
	i64 6471714727257221498, ; 252: fi\Microsoft.Maui.Controls.resources.dll => 0x59d026417dd4a97a => 343
	i64 6478287442656530074, ; 253: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 347
	i64 6504860066809920875, ; 254: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 258
	i64 6548213210057960872, ; 255: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 269
	i64 6557084851308642443, ; 256: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 315
	i64 6560151584539558821, ; 257: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 209
	i64 6589202984700901502, ; 258: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 320
	i64 6591971792923354531, ; 259: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 284
	i64 6597152804937602598, ; 260: ExoPlayer.Dash => 0x5b8dcb85db471626 => 235
	i64 6617685658146568858, ; 261: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6713440830605852118, ; 262: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 263: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 264: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 355
	i64 6747548184966280323, ; 265: StudentOrganiser.dll => 0x5da41b52fdbf3483 => 0
	i64 6772837112740759457, ; 266: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6786606130239981554, ; 267: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 268: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 269: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 270: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 271: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 7011053663211085209, ; 272: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 278
	i64 7060896174307865760, ; 273: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 274: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 275: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 276: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 279
	i64 7111139937678078858, ; 277: ExoPlayer.Database => 0x62afd818cd65338a => 236
	i64 7112547816752919026, ; 278: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7141281584637745974, ; 279: Xamarin.GooglePlayServices.Maps.dll => 0x631aedc3dd5f1b36 => 327
	i64 7192745174564810625, ; 280: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 248
	i64 7270811800166795866, ; 281: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 282: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 283: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7338192458477945005, ; 284: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 285: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 247
	i64 7377312882064240630, ; 286: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7473077275758116397, ; 287: Microsoft.DotNet.PlatformAbstractions => 0x67b5b430309b3e2d => 179
	i64 7488575175965059935, ; 288: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 289: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7554258198599408819, ; 290: ExoPlayer.Common => 0x68d61dceb5199cb3 => 232
	i64 7592577537120840276, ; 291: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 292: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 293: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 294: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7714652370974252055, ; 295: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 296: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 287
	i64 7735176074855944702, ; 297: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 298: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 330
	i64 7742555799473854801, ; 299: it\Microsoft.Maui.Controls.resources.dll => 0x6b73157a51479951 => 350
	i64 7791074099216502080, ; 300: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 301: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7836164640616011524, ; 302: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 255
	i64 7969868205614615900, ; 303: Microsoft.Extensions.Logging.Configuration => 0x6e9aa8e82656cd5c => 204
	i64 7972383140441761405, ; 304: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 184
	i64 7975724199463739455, ; 305: sk\Microsoft.Maui.Controls.resources.dll => 0x6eaf76e6f785e03f => 361
	i64 8024811125417330653, ; 306: ExoPlayer.Extractor.dll => 0x6f5ddb33881a47dd => 239
	i64 8025517457475554965, ; 307: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 308: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8038446328132759779, ; 309: Microsoft.Extensions.Logging.Configuration.dll => 0x6f8e4c588e6570e3 => 204
	i64 8059634771736097245, ; 310: ExoPlayer.Decoder => 0x6fd9931f84b771dd => 238
	i64 8064050204834738623, ; 311: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 312: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 281
	i64 8085230611270010360, ; 313: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 314: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 315: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8108129031893776750, ; 316: ko\Microsoft.Maui.Controls.resources.dll => 0x7085dc65530f796e => 352
	i64 8113615946733131500, ; 317: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8167236081217502503, ; 318: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 319: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 320: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 334
	i64 8246048515196606205, ; 321: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 218
	i64 8264926008854159966, ; 322: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 323: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 324: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8368701292315763008, ; 325: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8386351099740279196, ; 326: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x74624de475b9d19c => 367
	i64 8398329775253868912, ; 327: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 264
	i64 8400357532724379117, ; 328: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 297
	i64 8410671156615598628, ; 329: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 330: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 285
	i64 8472685364375177308, ; 331: Microsoft.Extensions.Configuration.CommandLine.dll => 0x75950672dd3bc85c => 189
	i64 8518412311883997971, ; 332: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8563666267364444763, ; 333: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 334: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 275
	i64 8599632406834268464, ; 335: CommunityToolkit.Maui => 0x7758081c784b4930 => 173
	i64 8601935802264776013, ; 336: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 309
	i64 8623059219396073920, ; 337: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 338: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 339: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 340: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 296
	i64 8648495978913578441, ; 341: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 342: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 357
	i64 8684531736582871431, ; 343: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8690461831448123647, ; 344: ExoPlayer.Hls => 0x789ab8fddd8e58ff => 240
	i64 8695364240710937812, ; 345: Microsoft.Extensions.Logging.EventSource.dll => 0x78ac23b4f835acd4 => 208
	i64 8725526185868997716, ; 346: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8853378295825400934, ; 347: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 331
	i64 8941376889969657626, ; 348: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 349: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 299
	i64 8954753533646919997, ; 350: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 9045785047181495996, ; 351: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 367
	i64 9111603110219107042, ; 352: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 185
	i64 9138683372487561558, ; 353: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9225789786819666723, ; 354: ExoPlayer.SmoothStreaming => 0x800896ee47d02323 => 242
	i64 9250544137016314866, ; 355: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 180
	i64 9312692141327339315, ; 356: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 314
	i64 9324707631942237306, ; 357: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 254
	i64 9363564275759486853, ; 358: el\Microsoft.Maui.Controls.resources.dll => 0x81f21019382e9785 => 341
	i64 9468215723722196442, ; 359: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9551379474083066910, ; 360: uk\Microsoft.Maui.Controls.resources.dll => 0x848d5106bbadb41e => 365
	i64 9554839972845591462, ; 361: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 362: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 319
	i64 9584643793929893533, ; 363: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9650158550865574924, ; 364: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 192
	i64 9659729154652888475, ; 365: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 366: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 367: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 368: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 265
	i64 9702891218465930390, ; 369: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9711637524876806384, ; 370: Xamarin.AndroidX.Media.dll => 0x86c6aadfd9a2c8f0 => 293
	i64 9722368759809762166, ; 371: ExoPlayer.Core => 0x86eccae02fd0e376 => 234
	i64 9773637193738963987, ; 372: ca\Microsoft.Maui.Controls.resources.dll => 0x87a2ef3ea85b4c13 => 337
	i64 9780093022148426479, ; 373: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 316
	i64 9808709177481450983, ; 374: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9825649861376906464, ; 375: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 262
	i64 9834056768316610435, ; 376: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 377: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9864956466380592553, ; 378: Microsoft.EntityFrameworkCore.Sqlite => 0x88e75da3af4ed5a9 => 183
	i64 9875200773399460291, ; 379: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 324
	i64 9907349773706910547, ; 380: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 275
	i64 9933555792566666578, ; 381: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9944345468791389265, ; 382: ExoPlayer.Core.dll => 0x8a01698437137c51 => 234
	i64 9956195530459977388, ; 383: Microsoft.Maui => 0x8a2b8315b36616ac => 216
	i64 9974604633896246661, ; 384: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 10017511394021241210, ; 385: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 206
	i64 10038780035334861115, ; 386: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 387: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10075958396420552332, ; 388: ExoPlayer => 0x8bd4fec6de42f68c => 231
	i64 10078727084704864206, ; 389: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 390: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 391: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 213
	i64 10099427421688105860, ; 392: ExoPlayer.Container.dll => 0x8c285fbb208f0b84 => 233
	i64 10105485790837105934, ; 393: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 394: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 339
	i64 10205853378024263619, ; 395: Microsoft.Extensions.Configuration.Binder => 0x8da279930adb4fc3 => 188
	i64 10209869394718195525, ; 396: nl\Microsoft.Maui.Controls.resources.dll => 0x8db0be1ecb4f7f45 => 355
	i64 10226222362177979215, ; 397: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 332
	i64 10229024438826829339, ; 398: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 269
	i64 10236703004850800690, ; 399: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10245369515835430794, ; 400: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 401: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 329
	i64 10360651442923773544, ; 402: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 403: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 404: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 308
	i64 10406448008575299332, ; 405: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 335
	i64 10430153318873392755, ; 406: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 266
	i64 10447083246144586668, ; 407: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 177
	i64 10506226065143327199, ; 408: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 337
	i64 10546663366131771576, ; 409: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 410: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 411: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 412: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 413: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10761706286639228993, ; 414: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0x955942d988382841 => 369
	i64 10785150219063592792, ; 415: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10809043855025277762, ; 416: Microsoft.Extensions.Options.ConfigurationExtensions => 0x9601701e0c668b42 => 210
	i64 10811915265162633087, ; 417: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 182
	i64 10822644899632537592, ; 418: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 419: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 420: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 256
	i64 10880838204485145808, ; 421: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 173
	i64 10889728536800937248, ; 422: Infra.SqliteBrowser.dll => 0x9720166870744520 => 221
	i64 10899834349646441345, ; 423: System.Web => 0x9743fd975946eb81 => 153
	i64 10943875058216066601, ; 424: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 425: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 11002576679268595294, ; 426: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 203
	i64 11004867042320771561, ; 427: Microsoft.Extensions.Logging.EventSource => 0x98b92444c9eee9e9 => 208
	i64 11009005086950030778, ; 428: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 216
	i64 11019817191295005410, ; 429: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 253
	i64 11023048688141570732, ; 430: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 431: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11071824625609515081, ; 432: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 320
	i64 11103762113411436187, ; 433: ExoPlayer.Container => 0x9a187ccfd8544e9b => 233
	i64 11103970607964515343, ; 434: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 348
	i64 11136029745144976707, ; 435: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 318
	i64 11156122287428000958, ; 436: th\Microsoft.Maui.Controls.resources.dll => 0x9ad2821cdcf6dcbe => 363
	i64 11157797727133427779, ; 437: fr\Microsoft.Maui.Controls.resources.dll => 0x9ad875ea9172e843 => 344
	i64 11162124722117608902, ; 438: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 313
	i64 11188319605227840848, ; 439: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 440: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 351
	i64 11226290749488709958, ; 441: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 209
	i64 11235648312900863002, ; 442: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11329751333533450475, ; 443: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 444: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 268
	i64 11347436699239206956, ; 445: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11366194298415195693, ; 446: CommunityToolkit.Maui.MediaElement => 0x9dbcd57e651ba62d => 175
	i64 11387716764763632936, ; 447: ExoPlayer.dll => 0x9e094c10167f3528 => 231
	i64 11392833485892708388, ; 448: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 298
	i64 11398376662953476300, ; 449: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x9e2f2b2f0b71c0cc => 183
	i64 11432101114902388181, ; 450: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 451: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 452: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 453: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 454: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 278
	i64 11518296021396496455, ; 455: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 349
	i64 11524696852620406333, ; 456: StudentOrganiser => 0x9feff2ba1c806e3d => 0
	i64 11529969570048099689, ; 457: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 313
	i64 11530571088791430846, ; 458: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 202
	i64 11580057168383206117, ; 459: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 251
	i64 11591352189662810718, ; 460: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 306
	i64 11597940890313164233, ; 461: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 462: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 279
	i64 11687474876782398100, ; 463: ExoPlayer.Decoder.dll => 0xa232407a3feaca94 => 238
	i64 11692977985522001935, ; 464: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11707554492040141440, ; 465: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11739066727115742305, ; 466: SQLite-net.dll => 0xa2e98afdf8575c61 => 224
	i64 11743665907891708234, ; 467: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11806260347154423189, ; 468: SQLite-net => 0xa3d8433bc5eb5d95 => 224
	i64 11855031688536399763, ; 469: vi\Microsoft.Maui.Controls.resources.dll => 0xa485888294361f93 => 366
	i64 11991047634523762324, ; 470: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 471: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12048689113179125827, ; 472: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 198
	i64 12058074296353848905, ; 473: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 199
	i64 12063623837170009990, ; 474: System.Security => 0xa76a99f6ce740786 => 130
	i64 12075303808054746781, ; 475: Plugin.Maui.Audio.dll => 0xa79418d5f2065e9d => 223
	i64 12096697103934194533, ; 476: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 477: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 478: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 479: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 310
	i64 12145679461940342714, ; 480: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 481: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 245
	i64 12201331334810686224, ; 482: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 483: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12279246230491828964, ; 484: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 229
	i64 12332222936682028543, ; 485: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12341818387765915815, ; 486: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 174
	i64 12375446203996702057, ; 487: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12451044538927396471, ; 488: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 277
	i64 12466513435562512481, ; 489: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 291
	i64 12475113361194491050, ; 490: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 370
	i64 12487638416075308985, ; 491: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 271
	i64 12517810545449516888, ; 492: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 493: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 259
	i64 12550732019250633519, ; 494: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12699999919562409296, ; 495: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 496: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 260
	i64 12708238894395270091, ; 497: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 498: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 499: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12753841065332862057, ; 500: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 315
	i64 12828192437253469131, ; 501: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 333
	i64 12835242264250840079, ; 502: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 503: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 211
	i64 12843770487262409629, ; 504: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 505: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12982280885948128408, ; 506: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 270
	i64 12989346753972519995, ; 507: ar\Microsoft.Maui.Controls.resources.dll => 0xb4436e0d5ee7c43b => 336
	i64 13005833372463390146, ; 508: pt-BR\Microsoft.Maui.Controls.resources.dll => 0xb47e008b5d99ddc2 => 357
	i64 13041731019321118825, ; 509: Plugin.Maui.Audio => 0xb4fd894396d41069 => 223
	i64 13068258254871114833, ; 510: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13129914918964716986, ; 511: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 274
	i64 13173818576982874404, ; 512: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13343850469010654401, ; 513: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 514: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 515: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 345
	i64 13385736475199088545, ; 516: ExoPlayer.Extractor => 0xb9c3b0674d3b27a1 => 239
	i64 13401370062847626945, ; 517: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 310
	i64 13402939433517888790, ; 518: Xamarin.Google.Guava.FailureAccess => 0xba00ce6728e8b516 => 322
	i64 13404347523447273790, ; 519: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 264
	i64 13431476299110033919, ; 520: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 521: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 323
	i64 13463706743370286408, ; 522: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 523: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 330
	i64 13491513212026656886, ; 524: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 257
	i64 13540124433173649601, ; 525: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 366
	i64 13550417756503177631, ; 526: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 197
	i64 13572454107664307259, ; 527: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 300
	i64 13578472628727169633, ; 528: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 529: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13621154251410165619, ; 530: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 270
	i64 13647894001087880694, ; 531: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 532: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 250
	i64 13702626353344114072, ; 533: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 534: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 535: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 536: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13768883594457632599, ; 537: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13828521679616088467, ; 538: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 331
	i64 13865727802090930648, ; 539: Xamarin.Google.Guava.dll => 0xc06cf5f8e3e341d8 => 321
	i64 13881769479078963060, ; 540: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13911222732217019342, ; 541: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13928444506500929300, ; 542: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13955418299340266673, ; 543: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 196
	i64 13959074834287824816, ; 544: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 277
	i64 13975254687929967048, ; 545: Xamarin.Google.Guava => 0xc1f2141837ada1c8 => 321
	i64 13982638193275851912, ; 546: ExoPlayer.Hls.dll => 0xc20c4f5a85045488 => 240
	i64 14075334701871371868, ; 547: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14124974489674258913, ; 548: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 259
	i64 14125464355221830302, ; 549: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14133832980772275001, ; 550: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 180
	i64 14178052285788134900, ; 551: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 246
	i64 14212104595480609394, ; 552: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 553: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 554: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 555: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 556: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 557: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 298
	i64 14298246716367104064, ; 558: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 559: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 560: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 561: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 247
	i64 14346402571976470310, ; 562: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14349907877893689639, ; 563: ro\Microsoft.Maui.Controls.resources.dll => 0xc7251d2f956ed127 => 359
	i64 14461014870687870182, ; 564: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 565: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 360
	i64 14486659737292545672, ; 566: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 282
	i64 14491877563792607819, ; 567: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0xc91d7ddcee4fca4b => 368
	i64 14495724990987328804, ; 568: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 301
	i64 14551742072151931844, ; 569: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14556034074661724008, ; 570: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 174
	i64 14561513370130550166, ; 571: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14574160591280636898, ; 572: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14610046442689856844, ; 573: cs\Microsoft.Maui.Controls.resources.dll => 0xcac14fd5107d054c => 338
	i64 14622043554576106986, ; 574: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 575: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 292
	i64 14669215534098758659, ; 576: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 194
	i64 14678510994762383812, ; 577: Xamarin.GooglePlayServices.Location.dll => 0xcbb48bfaca7a41c4 => 326
	i64 14690985099581930927, ; 578: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 579: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 352
	i64 14735017007120366644, ; 580: ja\Microsoft.Maui.Controls.resources.dll => 0xcc7d4be604bfbc34 => 351
	i64 14744092281598614090, ; 581: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 368
	i64 14792063746108907174, ; 582: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 323
	i64 14832630590065248058, ; 583: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14852515768018889994, ; 584: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 268
	i64 14889905118082851278, ; 585: GoogleGson.dll => 0xcea391d0969961ce => 176
	i64 14904040806490515477, ; 586: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 336
	i64 14905311287502520239, ; 587: Microsoft.Extensions.Hosting.dll => 0xceda4da4ee353faf => 200
	i64 14912225920358050525, ; 588: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 589: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 590: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 195
	i64 14984936317414011727, ; 591: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 592: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 593: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 271
	i64 15004680457737980385, ; 594: Microsoft.Extensions.Configuration.UserSecrets => 0xd03b5560cbb7c9e1 => 193
	i64 15015154896917945444, ; 595: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 596: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15055048765753425892, ; 597: SQLitePCLRaw.nativelibrary => 0xd0ee47165eea7fe4 => 225
	i64 15071021337266399595, ; 598: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 599: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 600: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 353
	i64 15115185479366240210, ; 601: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 602: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 603: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 299
	i64 15203009853192377507, ; 604: pt\Microsoft.Maui.Controls.resources.dll => 0xd2fbf0e9984b94a3 => 358
	i64 15227001540531775957, ; 605: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 187
	i64 15234786388537674379, ; 606: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 607: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 608: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 261
	i64 15279429628684179188, ; 609: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 334
	i64 15299439993936780255, ; 610: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15338463749992804988, ; 611: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370334346939861994, ; 612: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 266
	i64 15391712275433856905, ; 613: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 195
	i64 15475196252089753159, ; 614: System.Diagnostics.EventLog => 0xd6c2f1000b441e47 => 230
	i64 15526743539506359484, ; 615: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 616: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 617: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 618: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 340
	i64 15541854775306130054, ; 619: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 620: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15582737692548360875, ; 621: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 290
	i64 15609085926864131306, ; 622: System.dll => 0xd89e9cf3334914ea => 164
	i64 15620595871140898079, ; 623: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 196
	i64 15661133872274321916, ; 624: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15710114879900314733, ; 625: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15755368083429170162, ; 626: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 627: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 305
	i64 15783653065526199428, ; 628: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 341
	i64 15817206913877585035, ; 629: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15827202283623377193, ; 630: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 192
	i64 15847085070278954535, ; 631: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15885744048853936810, ; 632: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15915482068648965105, ; 633: Microsoft.Extensions.Configuration.EnvironmentVariables => 0xdcdf269e1aebb3f1 => 190
	i64 15928521404965645318, ; 634: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 212
	i64 15930129725311349754, ; 635: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 328
	i64 15934062614519587357, ; 636: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 637: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15959458866502526117, ; 638: Microsoft.Extensions.Configuration.EnvironmentVariables.dll => 0xdd7b6348415764a5 => 190
	i64 15963349826457351533, ; 639: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 640: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 641: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16048255734569022341, ; 642: ExoPlayer.Transformer => 0xdeb6db90339cb385 => 243
	i64 16054465462676478687, ; 643: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16056281320585338352, ; 644: ru\Microsoft.Maui.Controls.resources.dll => 0xded35eca8f3a9df0 => 360
	i64 16069846902195211555, ; 645: ExoPlayer.DataSource.dll => 0xdf03909da841cd23 => 237
	i64 16154507427712707110, ; 646: System => 0xe03056ea4e39aa26 => 164
	i64 16182611612321266217, ; 647: Microsoft.Maui.Maps => 0xe0942f85b2853a29 => 219
	i64 16219561732052121626, ; 648: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 649: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 354
	i64 16315482530584035869, ; 650: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 651: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 203
	i64 16337011941688632206, ; 652: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16361388015754824300, ; 653: Infra.Sqlite.dll => 0xe30f53b6c7664a6c => 220
	i64 16361933716545543812, ; 654: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 276
	i64 16423015068819898779, ; 655: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 333
	i64 16454459195343277943, ; 656: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 657: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16579050217386591297, ; 658: Xamarin.Google.Guava.FailureAccess.dll => 0xe6149e5548b0c441 => 322
	i64 16589693266713801121, ; 659: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 289
	i64 16621146507174665210, ; 660: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 263
	i64 16649148416072044166, ; 661: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 218
	i64 16677317093839702854, ; 662: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 297
	i64 16702652415771857902, ; 663: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 664: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 665: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16755018182064898362, ; 666: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 227
	i64 16758309481308491337, ; 667: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 668: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 669: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16803648858859583026, ; 670: ms\Microsoft.Maui.Controls.resources.dll => 0xe9328d9b8ab93632 => 353
	i64 16822611501064131242, ; 671: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 672: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 673: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 674: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 675: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 676: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 361
	i64 16977952268158210142, ; 677: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 678: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 289
	i64 16998075588627545693, ; 679: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 295
	i64 17008137082415910100, ; 680: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 681: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 252
	i64 17027804579603049667, ; 682: Microsoft.Maui.Controls.Maps.dll => 0xec4eea0c48026cc3 => 214
	i64 17031351772568316411, ; 683: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 294
	i64 17037200463775726619, ; 684: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 280
	i64 17047433665992082296, ; 685: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 191
	i64 17062143951396181894, ; 686: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17071469805149661853, ; 687: Microsoft.Extensions.Configuration.UserSecrets.dll => 0xecea0b56d9c0aa9d => 193
	i64 17118171214553292978, ; 688: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17187273293601214786, ; 689: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 690: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 691: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17203614576212522419, ; 692: pl\Microsoft.Maui.Controls.resources.dll => 0xeebf844ef3e135b3 => 356
	i64 17205988430934219272, ; 693: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 199
	i64 17230721278011714856, ; 694: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 695: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 696: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17310278548634113468, ; 697: hi\Microsoft.Maui.Controls.resources.dll => 0xf03a76a04e6695bc => 346
	i64 17333249706306540043, ; 698: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 699: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 700: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 346
	i64 17360349973592121190, ; 701: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 319
	i64 17375848869554566964, ; 702: ExoPlayer.Database.dll => 0xf1236a7c54ac3734 => 236
	i64 17470386307322966175, ; 703: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17472189583225440952, ; 704: ExoPlayer.Transformer.dll => 0xf279afdab46ecab8 => 243
	i64 17509662556995089465, ; 705: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 706: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 344
	i64 17522591619082469157, ; 707: GoogleGson => 0xf32cc03d27a5bf25 => 176
	i64 17590473451926037903, ; 708: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 245
	i64 17623389608345532001, ; 709: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 356
	i64 17627500474728259406, ; 710: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 711: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17704177640604968747, ; 712: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 291
	i64 17710060891934109755, ; 713: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 288
	i64 17712670374920797664, ; 714: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17777860260071588075, ; 715: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17827813215687577648, ; 716: hr\Microsoft.Maui.Controls.resources.dll => 0xf7691da9f3129030 => 347
	i64 17838668724098252521, ; 717: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 718: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 329
	i64 17928294245072900555, ; 719: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17942426894774770628, ; 720: de\Microsoft.Maui.Controls.resources.dll => 0xf9004e329f771bc4 => 340
	i64 17969331831154222830, ; 721: Xamarin.GooglePlayServices.Maps => 0xf95fe418471126ee => 327
	i64 17986907704309214542, ; 722: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 325
	i64 17992315986609351877, ; 723: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 724: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 184
	i64 18025913125965088385, ; 725: System.Threading => 0xfa28e87b91334681 => 148
	i64 18070190158559153715, ; 726: ExoPlayer.Rtsp.dll => 0xfac6363590ad8e33 => 241
	i64 18116111925905154859, ; 727: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 257
	i64 18121036031235206392, ; 728: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 294
	i64 18146411883821974900, ; 729: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 730: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18225059387460068507, ; 731: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 732: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 733: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 274
	i64 18305135509493619199, ; 734: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 296
	i64 18318849532986632368, ; 735: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 736: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 350
	i64 18342408478508122430, ; 737: id\Microsoft.Maui.Controls.resources.dll => 0xfe8d53543697013e => 349
	i64 18358161419737137786, ; 738: he\Microsoft.Maui.Controls.resources.dll => 0xfec54a8ba8b6827a => 345
	i64 18370042311372477656, ; 739: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 228
	i64 18380184030268848184, ; 740: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 312
	i64 18439108438687598470 ; 741: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [742 x i32] [
	i32 179, ; 0
	i32 273, ; 1
	i32 222, ; 2
	i32 211, ; 3
	i32 171, ; 4
	i32 217, ; 5
	i32 201, ; 6
	i32 58, ; 7
	i32 260, ; 8
	i32 151, ; 9
	i32 302, ; 10
	i32 305, ; 11
	i32 267, ; 12
	i32 132, ; 13
	i32 210, ; 14
	i32 56, ; 15
	i32 304, ; 16
	i32 326, ; 17
	i32 95, ; 18
	i32 219, ; 19
	i32 286, ; 20
	i32 191, ; 21
	i32 129, ; 22
	i32 188, ; 23
	i32 324, ; 24
	i32 145, ; 25
	i32 261, ; 26
	i32 18, ; 27
	i32 348, ; 28
	i32 228, ; 29
	i32 272, ; 30
	i32 287, ; 31
	i32 150, ; 32
	i32 235, ; 33
	i32 104, ; 34
	i32 95, ; 35
	i32 221, ; 36
	i32 317, ; 37
	i32 220, ; 38
	i32 36, ; 39
	i32 227, ; 40
	i32 28, ; 41
	i32 256, ; 42
	i32 295, ; 43
	i32 50, ; 44
	i32 115, ; 45
	i32 70, ; 46
	i32 213, ; 47
	i32 65, ; 48
	i32 170, ; 49
	i32 229, ; 50
	i32 145, ; 51
	i32 316, ; 52
	i32 255, ; 53
	i32 290, ; 54
	i32 280, ; 55
	i32 40, ; 56
	i32 89, ; 57
	i32 178, ; 58
	i32 81, ; 59
	i32 66, ; 60
	i32 62, ; 61
	i32 86, ; 62
	i32 254, ; 63
	i32 106, ; 64
	i32 342, ; 65
	i32 302, ; 66
	i32 102, ; 67
	i32 177, ; 68
	i32 35, ; 69
	i32 251, ; 70
	i32 364, ; 71
	i32 304, ; 72
	i32 215, ; 73
	i32 119, ; 74
	i32 288, ; 75
	i32 175, ; 76
	i32 142, ; 77
	i32 141, ; 78
	i32 332, ; 79
	i32 53, ; 80
	i32 35, ; 81
	i32 141, ; 82
	i32 248, ; 83
	i32 258, ; 84
	i32 181, ; 85
	i32 206, ; 86
	i32 272, ; 87
	i32 8, ; 88
	i32 14, ; 89
	i32 301, ; 90
	i32 51, ; 91
	i32 283, ; 92
	i32 136, ; 93
	i32 101, ; 94
	i32 241, ; 95
	i32 265, ; 96
	i32 311, ; 97
	i32 116, ; 98
	i32 249, ; 99
	i32 163, ; 100
	i32 363, ; 101
	i32 166, ; 102
	i32 67, ; 103
	i32 194, ; 104
	i32 338, ; 105
	i32 80, ; 106
	i32 101, ; 107
	i32 306, ; 108
	i32 117, ; 109
	i32 343, ; 110
	i32 200, ; 111
	i32 318, ; 112
	i32 78, ; 113
	i32 317, ; 114
	i32 114, ; 115
	i32 121, ; 116
	i32 48, ; 117
	i32 201, ; 118
	i32 232, ; 119
	i32 128, ; 120
	i32 281, ; 121
	i32 207, ; 122
	i32 252, ; 123
	i32 82, ; 124
	i32 110, ; 125
	i32 75, ; 126
	i32 335, ; 127
	i32 197, ; 128
	i32 325, ; 129
	i32 217, ; 130
	i32 53, ; 131
	i32 308, ; 132
	i32 186, ; 133
	i32 69, ; 134
	i32 307, ; 135
	i32 185, ; 136
	i32 83, ; 137
	i32 172, ; 138
	i32 358, ; 139
	i32 116, ; 140
	i32 187, ; 141
	i32 156, ; 142
	i32 186, ; 143
	i32 246, ; 144
	i32 167, ; 145
	i32 300, ; 146
	i32 273, ; 147
	i32 202, ; 148
	i32 32, ; 149
	i32 198, ; 150
	i32 215, ; 151
	i32 122, ; 152
	i32 72, ; 153
	i32 62, ; 154
	i32 161, ; 155
	i32 113, ; 156
	i32 339, ; 157
	i32 88, ; 158
	i32 212, ; 159
	i32 369, ; 160
	i32 105, ; 161
	i32 18, ; 162
	i32 146, ; 163
	i32 118, ; 164
	i32 58, ; 165
	i32 267, ; 166
	i32 17, ; 167
	i32 52, ; 168
	i32 328, ; 169
	i32 92, ; 170
	i32 230, ; 171
	i32 226, ; 172
	i32 364, ; 173
	i32 55, ; 174
	i32 129, ; 175
	i32 205, ; 176
	i32 152, ; 177
	i32 41, ; 178
	i32 182, ; 179
	i32 92, ; 180
	i32 181, ; 181
	i32 312, ; 182
	i32 50, ; 183
	i32 162, ; 184
	i32 13, ; 185
	i32 205, ; 186
	i32 285, ; 187
	i32 249, ; 188
	i32 307, ; 189
	i32 36, ; 190
	i32 67, ; 191
	i32 109, ; 192
	i32 354, ; 193
	i32 362, ; 194
	i32 250, ; 195
	i32 99, ; 196
	i32 99, ; 197
	i32 11, ; 198
	i32 178, ; 199
	i32 11, ; 200
	i32 292, ; 201
	i32 25, ; 202
	i32 128, ; 203
	i32 244, ; 204
	i32 76, ; 205
	i32 284, ; 206
	i32 109, ; 207
	i32 293, ; 208
	i32 311, ; 209
	i32 244, ; 210
	i32 309, ; 211
	i32 106, ; 212
	i32 2, ; 213
	i32 26, ; 214
	i32 263, ; 215
	i32 157, ; 216
	i32 362, ; 217
	i32 21, ; 218
	i32 365, ; 219
	i32 49, ; 220
	i32 222, ; 221
	i32 207, ; 222
	i32 43, ; 223
	i32 126, ; 224
	i32 214, ; 225
	i32 253, ; 226
	i32 59, ; 227
	i32 225, ; 228
	i32 119, ; 229
	i32 314, ; 230
	i32 242, ; 231
	i32 276, ; 232
	i32 262, ; 233
	i32 3, ; 234
	i32 282, ; 235
	i32 303, ; 236
	i32 38, ; 237
	i32 124, ; 238
	i32 303, ; 239
	i32 189, ; 240
	i32 226, ; 241
	i32 359, ; 242
	i32 137, ; 243
	i32 149, ; 244
	i32 85, ; 245
	i32 90, ; 246
	i32 342, ; 247
	i32 237, ; 248
	i32 286, ; 249
	i32 370, ; 250
	i32 283, ; 251
	i32 343, ; 252
	i32 347, ; 253
	i32 258, ; 254
	i32 269, ; 255
	i32 315, ; 256
	i32 209, ; 257
	i32 320, ; 258
	i32 284, ; 259
	i32 235, ; 260
	i32 133, ; 261
	i32 96, ; 262
	i32 3, ; 263
	i32 355, ; 264
	i32 0, ; 265
	i32 105, ; 266
	i32 33, ; 267
	i32 154, ; 268
	i32 158, ; 269
	i32 155, ; 270
	i32 82, ; 271
	i32 278, ; 272
	i32 143, ; 273
	i32 87, ; 274
	i32 19, ; 275
	i32 279, ; 276
	i32 236, ; 277
	i32 51, ; 278
	i32 327, ; 279
	i32 248, ; 280
	i32 61, ; 281
	i32 54, ; 282
	i32 4, ; 283
	i32 97, ; 284
	i32 247, ; 285
	i32 17, ; 286
	i32 179, ; 287
	i32 155, ; 288
	i32 84, ; 289
	i32 232, ; 290
	i32 29, ; 291
	i32 45, ; 292
	i32 64, ; 293
	i32 66, ; 294
	i32 172, ; 295
	i32 287, ; 296
	i32 1, ; 297
	i32 330, ; 298
	i32 350, ; 299
	i32 47, ; 300
	i32 24, ; 301
	i32 255, ; 302
	i32 204, ; 303
	i32 184, ; 304
	i32 361, ; 305
	i32 239, ; 306
	i32 165, ; 307
	i32 108, ; 308
	i32 204, ; 309
	i32 238, ; 310
	i32 12, ; 311
	i32 281, ; 312
	i32 63, ; 313
	i32 27, ; 314
	i32 23, ; 315
	i32 352, ; 316
	i32 93, ; 317
	i32 168, ; 318
	i32 12, ; 319
	i32 334, ; 320
	i32 218, ; 321
	i32 29, ; 322
	i32 103, ; 323
	i32 14, ; 324
	i32 126, ; 325
	i32 367, ; 326
	i32 264, ; 327
	i32 297, ; 328
	i32 91, ; 329
	i32 285, ; 330
	i32 189, ; 331
	i32 9, ; 332
	i32 86, ; 333
	i32 275, ; 334
	i32 173, ; 335
	i32 309, ; 336
	i32 71, ; 337
	i32 168, ; 338
	i32 1, ; 339
	i32 296, ; 340
	i32 5, ; 341
	i32 357, ; 342
	i32 44, ; 343
	i32 240, ; 344
	i32 208, ; 345
	i32 27, ; 346
	i32 331, ; 347
	i32 158, ; 348
	i32 299, ; 349
	i32 112, ; 350
	i32 367, ; 351
	i32 185, ; 352
	i32 121, ; 353
	i32 242, ; 354
	i32 180, ; 355
	i32 314, ; 356
	i32 254, ; 357
	i32 341, ; 358
	i32 159, ; 359
	i32 365, ; 360
	i32 131, ; 361
	i32 319, ; 362
	i32 57, ; 363
	i32 192, ; 364
	i32 138, ; 365
	i32 83, ; 366
	i32 30, ; 367
	i32 265, ; 368
	i32 10, ; 369
	i32 293, ; 370
	i32 234, ; 371
	i32 337, ; 372
	i32 316, ; 373
	i32 171, ; 374
	i32 262, ; 375
	i32 150, ; 376
	i32 94, ; 377
	i32 183, ; 378
	i32 324, ; 379
	i32 275, ; 380
	i32 60, ; 381
	i32 234, ; 382
	i32 216, ; 383
	i32 157, ; 384
	i32 206, ; 385
	i32 64, ; 386
	i32 88, ; 387
	i32 231, ; 388
	i32 79, ; 389
	i32 47, ; 390
	i32 213, ; 391
	i32 233, ; 392
	i32 143, ; 393
	i32 339, ; 394
	i32 188, ; 395
	i32 355, ; 396
	i32 332, ; 397
	i32 269, ; 398
	i32 74, ; 399
	i32 91, ; 400
	i32 329, ; 401
	i32 135, ; 402
	i32 90, ; 403
	i32 308, ; 404
	i32 335, ; 405
	i32 266, ; 406
	i32 177, ; 407
	i32 337, ; 408
	i32 112, ; 409
	i32 42, ; 410
	i32 159, ; 411
	i32 4, ; 412
	i32 103, ; 413
	i32 369, ; 414
	i32 70, ; 415
	i32 210, ; 416
	i32 182, ; 417
	i32 60, ; 418
	i32 39, ; 419
	i32 256, ; 420
	i32 173, ; 421
	i32 221, ; 422
	i32 153, ; 423
	i32 56, ; 424
	i32 34, ; 425
	i32 203, ; 426
	i32 208, ; 427
	i32 216, ; 428
	i32 253, ; 429
	i32 21, ; 430
	i32 163, ; 431
	i32 320, ; 432
	i32 233, ; 433
	i32 348, ; 434
	i32 318, ; 435
	i32 363, ; 436
	i32 344, ; 437
	i32 313, ; 438
	i32 140, ; 439
	i32 351, ; 440
	i32 209, ; 441
	i32 89, ; 442
	i32 147, ; 443
	i32 268, ; 444
	i32 162, ; 445
	i32 175, ; 446
	i32 231, ; 447
	i32 298, ; 448
	i32 183, ; 449
	i32 6, ; 450
	i32 169, ; 451
	i32 31, ; 452
	i32 107, ; 453
	i32 278, ; 454
	i32 349, ; 455
	i32 0, ; 456
	i32 313, ; 457
	i32 202, ; 458
	i32 251, ; 459
	i32 306, ; 460
	i32 167, ; 461
	i32 279, ; 462
	i32 238, ; 463
	i32 140, ; 464
	i32 59, ; 465
	i32 224, ; 466
	i32 144, ; 467
	i32 224, ; 468
	i32 366, ; 469
	i32 81, ; 470
	i32 74, ; 471
	i32 198, ; 472
	i32 199, ; 473
	i32 130, ; 474
	i32 223, ; 475
	i32 25, ; 476
	i32 7, ; 477
	i32 93, ; 478
	i32 310, ; 479
	i32 137, ; 480
	i32 245, ; 481
	i32 113, ; 482
	i32 9, ; 483
	i32 229, ; 484
	i32 104, ; 485
	i32 174, ; 486
	i32 19, ; 487
	i32 277, ; 488
	i32 291, ; 489
	i32 370, ; 490
	i32 271, ; 491
	i32 33, ; 492
	i32 259, ; 493
	i32 46, ; 494
	i32 30, ; 495
	i32 260, ; 496
	i32 57, ; 497
	i32 134, ; 498
	i32 114, ; 499
	i32 315, ; 500
	i32 333, ; 501
	i32 55, ; 502
	i32 211, ; 503
	i32 6, ; 504
	i32 77, ; 505
	i32 270, ; 506
	i32 336, ; 507
	i32 357, ; 508
	i32 223, ; 509
	i32 111, ; 510
	i32 274, ; 511
	i32 102, ; 512
	i32 170, ; 513
	i32 115, ; 514
	i32 345, ; 515
	i32 239, ; 516
	i32 310, ; 517
	i32 322, ; 518
	i32 264, ; 519
	i32 76, ; 520
	i32 323, ; 521
	i32 85, ; 522
	i32 330, ; 523
	i32 257, ; 524
	i32 366, ; 525
	i32 197, ; 526
	i32 300, ; 527
	i32 160, ; 528
	i32 2, ; 529
	i32 270, ; 530
	i32 24, ; 531
	i32 250, ; 532
	i32 32, ; 533
	i32 117, ; 534
	i32 37, ; 535
	i32 16, ; 536
	i32 52, ; 537
	i32 331, ; 538
	i32 321, ; 539
	i32 20, ; 540
	i32 123, ; 541
	i32 154, ; 542
	i32 196, ; 543
	i32 277, ; 544
	i32 321, ; 545
	i32 240, ; 546
	i32 131, ; 547
	i32 259, ; 548
	i32 148, ; 549
	i32 180, ; 550
	i32 246, ; 551
	i32 120, ; 552
	i32 28, ; 553
	i32 132, ; 554
	i32 100, ; 555
	i32 134, ; 556
	i32 298, ; 557
	i32 153, ; 558
	i32 97, ; 559
	i32 125, ; 560
	i32 247, ; 561
	i32 69, ; 562
	i32 359, ; 563
	i32 72, ; 564
	i32 360, ; 565
	i32 282, ; 566
	i32 368, ; 567
	i32 301, ; 568
	i32 136, ; 569
	i32 174, ; 570
	i32 124, ; 571
	i32 71, ; 572
	i32 338, ; 573
	i32 111, ; 574
	i32 292, ; 575
	i32 194, ; 576
	i32 326, ; 577
	i32 152, ; 578
	i32 352, ; 579
	i32 351, ; 580
	i32 368, ; 581
	i32 323, ; 582
	i32 118, ; 583
	i32 268, ; 584
	i32 176, ; 585
	i32 336, ; 586
	i32 200, ; 587
	i32 127, ; 588
	i32 133, ; 589
	i32 195, ; 590
	i32 77, ; 591
	i32 46, ; 592
	i32 271, ; 593
	i32 193, ; 594
	i32 73, ; 595
	i32 63, ; 596
	i32 225, ; 597
	i32 98, ; 598
	i32 84, ; 599
	i32 353, ; 600
	i32 43, ; 601
	i32 61, ; 602
	i32 299, ; 603
	i32 358, ; 604
	i32 187, ; 605
	i32 37, ; 606
	i32 40, ; 607
	i32 261, ; 608
	i32 334, ; 609
	i32 160, ; 610
	i32 98, ; 611
	i32 266, ; 612
	i32 195, ; 613
	i32 230, ; 614
	i32 135, ; 615
	i32 20, ; 616
	i32 65, ; 617
	i32 340, ; 618
	i32 125, ; 619
	i32 75, ; 620
	i32 290, ; 621
	i32 164, ; 622
	i32 196, ; 623
	i32 156, ; 624
	i32 5, ; 625
	i32 49, ; 626
	i32 305, ; 627
	i32 341, ; 628
	i32 144, ; 629
	i32 192, ; 630
	i32 139, ; 631
	i32 100, ; 632
	i32 190, ; 633
	i32 212, ; 634
	i32 328, ; 635
	i32 123, ; 636
	i32 120, ; 637
	i32 190, ; 638
	i32 142, ; 639
	i32 39, ; 640
	i32 68, ; 641
	i32 243, ; 642
	i32 41, ; 643
	i32 360, ; 644
	i32 237, ; 645
	i32 164, ; 646
	i32 219, ; 647
	i32 73, ; 648
	i32 354, ; 649
	i32 165, ; 650
	i32 203, ; 651
	i32 127, ; 652
	i32 220, ; 653
	i32 276, ; 654
	i32 333, ; 655
	i32 68, ; 656
	i32 169, ; 657
	i32 322, ; 658
	i32 289, ; 659
	i32 263, ; 660
	i32 218, ; 661
	i32 297, ; 662
	i32 151, ; 663
	i32 45, ; 664
	i32 108, ; 665
	i32 227, ; 666
	i32 48, ; 667
	i32 96, ; 668
	i32 31, ; 669
	i32 353, ; 670
	i32 23, ; 671
	i32 166, ; 672
	i32 22, ; 673
	i32 138, ; 674
	i32 78, ; 675
	i32 361, ; 676
	i32 54, ; 677
	i32 289, ; 678
	i32 295, ; 679
	i32 10, ; 680
	i32 252, ; 681
	i32 214, ; 682
	i32 294, ; 683
	i32 280, ; 684
	i32 191, ; 685
	i32 16, ; 686
	i32 193, ; 687
	i32 139, ; 688
	i32 13, ; 689
	i32 15, ; 690
	i32 122, ; 691
	i32 356, ; 692
	i32 199, ; 693
	i32 87, ; 694
	i32 149, ; 695
	i32 22, ; 696
	i32 346, ; 697
	i32 34, ; 698
	i32 79, ; 699
	i32 346, ; 700
	i32 319, ; 701
	i32 236, ; 702
	i32 147, ; 703
	i32 243, ; 704
	i32 80, ; 705
	i32 344, ; 706
	i32 176, ; 707
	i32 245, ; 708
	i32 356, ; 709
	i32 42, ; 710
	i32 26, ; 711
	i32 291, ; 712
	i32 288, ; 713
	i32 107, ; 714
	i32 110, ; 715
	i32 347, ; 716
	i32 7, ; 717
	i32 329, ; 718
	i32 44, ; 719
	i32 340, ; 720
	i32 327, ; 721
	i32 325, ; 722
	i32 161, ; 723
	i32 184, ; 724
	i32 148, ; 725
	i32 241, ; 726
	i32 257, ; 727
	i32 294, ; 728
	i32 38, ; 729
	i32 15, ; 730
	i32 146, ; 731
	i32 8, ; 732
	i32 274, ; 733
	i32 296, ; 734
	i32 130, ; 735
	i32 350, ; 736
	i32 349, ; 737
	i32 345, ; 738
	i32 228, ; 739
	i32 312, ; 740
	i32 94 ; 741
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
