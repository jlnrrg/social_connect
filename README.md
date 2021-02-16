# Social Connect

Do you want to save yourself trouble programming a chat into your flutter app? <br>
Why not just link to already existing social messing applications? <br>
With **social_connect** you can fill in your details and set privacy settings. <br>
Others then just click on their prefered social messenger and get forwarded to your profile.

## Extra Functionality

- TextFormField checks for copied profile links and @
  - on find it removes everything aside the username

## Usage
- take a look at the example
- SocialShare provides 2 constructors
  - edit (for editing username and visibility)
  - show (for showing the username and onClick forwarding)
- SocialShare.edit provides the onChanged callback, <br>where the SocialAccount can be further processed (eg. written to a db)


## Included Services (24)
- discord
- element
- email
- facebook
- icq
- imgur
- instagram
- line
- linkedin
- phone
- reddit
- sinaweibo
- skype
- snapchat
- telegram
- threema
- tiktok
- tinder
- tumblr
- twitter
- viber
- wechat
- whatsapp
- xing