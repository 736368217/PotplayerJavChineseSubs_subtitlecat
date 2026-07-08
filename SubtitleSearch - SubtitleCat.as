/*
	subtitle search by SubtitleCat.com
	Based on subtitlecat.com website parsing
	No API key required
*/

string SITE_URL = "https://www.subtitlecat.com";

// Language code mapping from subtitlecat.com language names
dictionary LangMap;

void InitLangMap()
{
	LangMap["Danish"] = "da";
	LangMap["English"] = "en";
	LangMap["Chinese (Simplified)"] = "zh-CN";
	LangMap["Chinese (Traditional)"] = "zh-TW";
	LangMap["Japanese"] = "ja";
	LangMap["Korean"] = "ko";
	LangMap["French"] = "fr";
	LangMap["German"] = "de";
	LangMap["Spanish"] = "es";
	LangMap["Italian"] = "it";
	LangMap["Portuguese"] = "pt";
	LangMap["Russian"] = "ru";
	LangMap["Arabic"] = "ar";
	LangMap["Dutch"] = "nl";
	LangMap["Swedish"] = "sv";
	LangMap["Norwegian"] = "no";
	LangMap["Finnish"] = "fi";
	LangMap["Polish"] = "pl";
	LangMap["Turkish"] = "tr";
	LangMap["Greek"] = "el";
	LangMap["Hungarian"] = "hu";
	LangMap["Czech"] = "cs";
	LangMap["Romanian"] = "ro";
	LangMap["Thai"] = "th";
	LangMap["Vietnamese"] = "vi";
	LangMap["Indonesian"] = "id";
	LangMap["Malay"] = "ms";
	LangMap["Hindi"] = "hi";
	LangMap["Bengali"] = "bn";
	LangMap["Urdu"] = "ur";
	LangMap["Persian"] = "fa";
	LangMap["Hebrew"] = "he";
	LangMap["Bulgarian"] = "bg";
	LangMap["Croatian"] = "hr";
	LangMap["Serbian"] = "sr";
	LangMap["Slovak"] = "sk";
	LangMap["Slovenian"] = "sl";
	LangMap["Ukrainian"] = "uk";
	LangMap["Catalan"] = "ca";
	LangMap["Galician"] = "gl";
	LangMap["Basque"] = "eu";
	LangMap["Albanian"] = "sq";
	LangMap["Estonian"] = "et";
	LangMap["Latvian"] = "lv";
	LangMap["Lithuanian"] = "lt";
	LangMap["Macedonian"] = "mk";
	LangMap["Icelandic"] = "is";
	LangMap["Georgian"] = "ka";
	LangMap["Armenian"] = "hy";
	LangMap["Azerbaijani"] = "az";
	LangMap["Kazakh"] = "kk";
	LangMap["Uzbek"] = "uz";
	LangMap["Tamil"] = "ta";
	LangMap["Telugu"] = "te";
	LangMap["Kannada"] = "kn";
	LangMap["Malayalam"] = "ml";
	LangMap["Marathi"] = "mr";
	LangMap["Gujarati"] = "gu";
	LangMap["Punjabi"] = "pa";
	LangMap["Burmese"] = "my";
	LangMap["Khmer"] = "km";
	LangMap["Lao"] = "lo";
	LangMap["Mongolian"] = "mn";
	LangMap["Nepali"] = "ne";
	LangMap["Sinhala"] = "si";
	LangMap["Pashto"] = "ps";
	LangMap["Kurdish"] = "ku";
	LangMap["Amharic"] = "am";
	LangMap["Swahili"] = "sw";
	LangMap["Afrikaans"] = "af";
	LangMap["Hausa"] = "ha";
	LangMap["Yoruba"] = "yo";
	LangMap["Igbo"] = "ig";
	LangMap["Zulu"] = "zu";
	LangMap["Somali"] = "so";
	LangMap["Welsh"] = "cy";
	LangMap["Irish"] = "ga";
	LangMap["Scots Gaelic"] = "gd";
	LangMap["Yiddish"] = "yi";
	LangMap["Luxembourgish"] = "lb";
	LangMap["Maltese"] = "mt";
	LangMap["Frisian"] = "fy";
	LangMap["Corsican"] = "co";
	LangMap["Breton"] = "br";
	LangMap["Occitan"] = "oc";
	LangMap["Maori"] = "mi";
	LangMap["Samoan"] = "sm";
	LangMap["Hawaiian"] = "haw";
	LangMap["Esperanto"] = "eo";
	LangMap["Latin"] = "la";
	LangMap["Sundanese"] = "su";
	LangMap["Javanese"] = "jv";
	LangMap["Filipino"] = "tl";
	LangMap["Cebuano"] = "ceb";
	LangMap["Malagasy"] = "mg";
	LangMap["Tajik"] = "tg";
	LangMap["Tatar"] = "tt";
	LangMap["Turkmen"] = "tk";
	LangMap["Kyrgyz"] = "ky";
	LangMap["Uighur"] = "ug";
	LangMap["Tibetan"] = "bo";
	LangMap["Dzongkha"] = "dz";
	LangMap["Tigrinya"] = "ti";
	LangMap["Oromo"] = "om";
	LangMap["Kinyarwanda"] = "rw";
	LangMap["Kirundi"] = "rn";
	LangMap["Lingala"] = "ln";
	LangMap["Luganda"] = "lg";
	LangMap["Shona"] = "sn";
	LangMap["Chewa"] = "ny";
	LangMap["Xhosa"] = "xh";
	LangMap["Sesotho"] = "st";
	LangMap["Tswana"] = "tn";
	LangMap["Tonga"] = "to";
	LangMap["Fijian"] = "fj";
	LangMap["Bambara"] = "bm";
	LangMap["Akan"] = "ak";
	LangMap["Ewe"] = "ee";
	LangMap["Twi"] = "tw";
	LangMap["Bemba"] = "bem";
	LangMap["Sindhi"] = "sd";
	LangMap["Guarani"] = "gn";
	LangMap["Quechua"] = "qu";
	LangMap["Inuktitut"] = "iu";
	LangMap["Greenlandic"] = "kl";
	LangMap["Faroese"] = "fo";
	LangMap["Romansh"] = "rm";
	LangMap["Bosnian"] = "bs";
	LangMap["Montenegrin"] = "me";
}

array<array<string>> LangTable =
{
	{ "en", "English" },
	{ "zh-CN", "Simplified Chinese" },
	{ "zh-TW", "Traditional Chinese" },
	{ "ja", "Japanese" },
	{ "ko", "Korean" },
	{ "fr", "French" },
	{ "de", "German" },
	{ "es", "Spanish" },
	{ "it", "Italian" },
	{ "pt", "Portuguese" },
	{ "ru", "Russian" },
	{ "ar", "Arabic" },
	{ "nl", "Dutch" },
	{ "sv", "Swedish" },
	{ "no", "Norwegian" },
	{ "fi", "Finnish" },
	{ "pl", "Polish" },
	{ "tr", "Turkish" },
	{ "th", "Thai" },
	{ "vi", "Vietnamese" },
	{ "id", "Indonesian" },
	{ "hi", "Hindi" },
	{ "da", "Danish" },
	{ "el", "Greek" },
	{ "hu", "Hungarian" },
	{ "cs", "Czech" },
	{ "ro", "Romanian" }
};

string HtmlSpecialCharsDecode(string str)
{
	str.replace("&amp;", "&");
	str.replace("&quot;", "\"");
	str.replace("&#039;", "'");
	str.replace("&lt;", "<");
	str.replace("&gt;", ">");
	str.replace("&rsquo;", "'");
	str.replace("&nbsp;", " ");
	return str;
}

bool IsVideoExtension(string ext)
{
	return ext == "mp4" || ext == "mkv" || ext == "avi" || ext == "wmv" ||
	       ext == "flv" || ext == "webm" || ext == "mov" || ext == "ts" ||
	       ext == "m2ts" || ext == "rmvb" || ext == "mpg" || ext == "mpeg" ||
	       ext == "divx" || ext == "3gp" || ext == "vob" || ext == "asf" ||
	       ext == "m4v" || ext == "rm" || ext == "ogm" || ext == "ogv";
}

string CleanTitle(string title)
{
	// Remove leading website prefix like "xxx.com@" or "xxx.net@"
	int atPos = title.findFirst("@");
	if (atPos >= 0 && atPos < title.length() - 1)
	{
		string beforeAt = title.substr(0, atPos);
		if (beforeAt.findFirst(".") >= 0 && beforeAt.length() <= 30)
		{
			title = title.substr(atPos + 1);
		}
	}

	// Remove file extension
	int lastDot = -1;
	int pos = 0;
	while ((pos = title.findFirst(".", pos)) >= 0)
	{
		lastDot = pos;
		pos++;
	}
	if (lastDot >= 0)
	{
		string ext = title.substr(lastDot + 1);
		if (IsVideoExtension(ext))
		{
			title = title.substr(0, lastDot);
		}
	}

	// Remove trailing resolution/quality tag (like -4K, -720p, -1080p, -FHD)
	array<string> qualityTags =
	{
		"-4K", "-4k", "-2K", "-2k", "-8K", "-8k",
		"-720p", "-1080p", "-2160p", "-480p", "-360p",
		"-HD", "-hd", "-FHD", "-fhd", "-UHD", "-uhd",
		"-SD", "-sd"
	};
	bool changed = true;
	while (changed)
	{
		changed = false;
		for (int i = 0; i < qualityTags.size(); i++)
		{
			string tag = qualityTags[i];
			if (title.length() > tag.length())
			{
				string suffix = title.substr(title.length() - tag.length());
				if (suffix == tag)
				{
					title = title.substr(0, title.length() - tag.length());
					changed = true;
					break;
				}
			}
		}
	}

	return title;
}

string GetTitle()
{
	return "SubtitleCat";
}

string GetVersion()
{
	return "1.0";
}

string GetDesc()
{
	return "SubtitleCat.com 字幕搜索插件 - 无需API密钥";
}

string GetLoginTitle()
{
	return "";
}

string GetLoginDesc()
{
	return "";
}

string GetLanguages()
{
	string ret = "";
	for(int i = 0, len = LangTable.size(); i < len; i++)
	{
		string lang = LangTable[i][0];

		if (!lang.empty())
		{
			if (ret.empty()) ret = lang;
			else ret = ret + "," + lang;
		}
	}
	return ret;
}

string ServerCheck(string User, string Pass)
{
	InitLangMap();
	return "无需登录，SubtitleCat.com 公开访问";
}

string ServerLogin(string User, string Pass)
{
	InitLangMap();
	return "无需登录，SubtitleCat.com 公开访问";
}

string MapLangCode(string langName)
{
	if (LangMap.exists(langName))
	{
		return string(LangMap[langName]);
	}
	return "";
}

string SubtitleWebSearch(string MovieFileName, dictionary MovieMetaData)
{
	string title = HtmlSpecialCharsDecode(string(MovieMetaData["title"]));
	title = CleanTitle(title);

	if(MovieMetaData.exists("seasonNumber")){
		string season = string(MovieMetaData["seasonNumber"]);
		if(season.length() < 2){
			season = '0' + season;
		}
		if(MovieMetaData.exists("episodeNumber")){
			string episode = string(MovieMetaData["episodeNumber"]);
			if(episode.length() < 2){
				episode = '0' + episode;
			}
			title = title + " S" + season + 'E' + episode;
		}
		else{
			title = title + " S" + season;
		}
	}

	string finalURL = SITE_URL + "/index.php?search=" + HostUrlEncode(title);
	return finalURL;
}

array<dictionary> SubtitleSearch(string MovieFileName, dictionary MovieMetaData)
{
	InitLangMap();
	array<dictionary> ret;

	array<string> MovieFileNameSplit = MovieFileName.split(".");
	if(MovieFileNameSplit[MovieFileNameSplit.length()-1] == "mpls" ||
	   MovieFileNameSplit[MovieFileNameSplit.length()-1] == "m2ts"){
		return ret;
	}

	string title = HtmlSpecialCharsDecode(string(MovieMetaData["title"]));
	title = CleanTitle(title);
	if(MovieMetaData.exists("seasonNumber")){
		string season = string(MovieMetaData["seasonNumber"]);
		if(season.length() < 2){
			season = '0' + season;
		}
		if(MovieMetaData.exists("episodeNumber")){
			string episode = string(MovieMetaData["episodeNumber"]);
			if(episode.length() < 2){
				episode = '0' + episode;
			}
			title = title + " S" + season + 'E' + episode;
		}
		else{
			title = title + " S" + season;
		}
	}

	string searchURL = SITE_URL + "/index.php?search=" + HostUrlEncode(title);
	string html = HostUrlGetString(searchURL);

	if (html.empty()) return ret;

	int searchPos = 0;

	while (true)
	{
		searchPos = html.findFirst("href=\"subs/", searchPos);
		if (searchPos < 0) break;

		int hrefStart = searchPos + 6;
		int hrefEnd = html.findFirst("\"", hrefStart);
		if (hrefEnd < 0) break;

		string href = html.substr(hrefStart, hrefEnd - hrefStart);

		int titleStart = html.findFirst(">", hrefEnd);
		if (titleStart < 0) { searchPos = hrefEnd + 1; continue; }
		titleStart++;

		int titleEnd = html.findFirst("</a>", titleStart);
		if (titleEnd < 0) { searchPos = hrefEnd + 1; continue; }

		string subTitle = html.substr(titleStart, titleEnd - titleStart);
		subTitle = HtmlSpecialCharsDecode(subTitle);

		string format = "srt";

		dictionary item;
		item["id"] = href;
		item["title"] = subTitle;
		item["lang"] = "zh-CN";
		item["format"] = format;
		item["fileName"] = subTitle + "." + format;
		item["url"] = SITE_URL + "/" + href;

		ret.insertLast(item);

		if (ret.size() >= 60) break;
		searchPos = hrefEnd + 1;
	}

	return ret;
}

string SubtitleDownload(string id)
{
	InitLangMap();

	string detailURL = SITE_URL + "/" + id;
	string html = HostUrlGetString(detailURL);

	if (html.empty()) return "";

	// Collect all .srt download links, prefer Chinese
	string bestSrtUrl = "";
	string anySrtUrl = "";

	int hrefPos = 0;
	while (true)
	{
		hrefPos = html.findFirst("href=\"/subs/", hrefPos);
		if (hrefPos < 0) break;

		int urlStart = hrefPos + 6;
		int urlEnd = html.findFirst("\"", urlStart);
		if (urlEnd < 0) { hrefPos++; continue; }

		string downloadPath = html.substr(urlStart, urlEnd - urlStart);
		if (downloadPath.findFirst(".srt") >= 0)
		{
			if (anySrtUrl.empty())
			{
				anySrtUrl = SITE_URL + downloadPath;
			}

			if (downloadPath.findFirst("zh-CN") >= 0 || downloadPath.findFirst("zh-TW") >= 0)
			{
				bestSrtUrl = SITE_URL + downloadPath;
				break;
			}
		}
		hrefPos = urlEnd + 1;
	}

	if (!bestSrtUrl.empty())
	{
		return HostUrlGetString(bestSrtUrl);
	}

	if (!anySrtUrl.empty())
	{
		return HostUrlGetString(anySrtUrl);
	}

	// Method 2: parse orig file from translate_from_server_folder
	int tfPos = html.findFirst("translate_from_server_folder(");
	if (tfPos >= 0)
	{
		int parenStart = tfPos + 28;
		int parenEnd = html.findFirst(")", parenStart);
		if (parenEnd >= 0)
		{
			string args = html.substr(parenStart, parenEnd - parenStart);

			int firstQuote = args.findFirst("'");
			if (firstQuote >= 0)
			{
				int firstEnd = args.findFirst("'", firstQuote + 1);
				if (firstEnd >= 0)
				{
					int secondQuote = args.findFirst("'", firstEnd + 1);
					if (secondQuote >= 0)
					{
						int secondEnd = args.findFirst("'", secondQuote + 1);
						if (secondEnd >= 0)
						{
							string fileName = args.substr(secondQuote + 1, secondEnd - secondQuote - 1);

							int thirdQuote = args.findFirst("'", secondEnd + 1);
							if (thirdQuote >= 0)
							{
								int thirdEnd = args.findFirst("'", thirdQuote + 1);
								if (thirdEnd >= 0)
								{
									string folderPath = args.substr(thirdQuote + 1, thirdEnd - thirdQuote - 1);
									string downloadURL = SITE_URL + folderPath + fileName;
									return HostUrlGetString(downloadURL);
								}
							}
						}
					}
				}
			}
		}
	}

	return "";
}
