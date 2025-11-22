# Convert videos with FFMPEG into ivf & extract audio to separate file because UZDoom currently is afraid
# to implement anything with mp4 due to still stigmatizings despite its patent expiry just been months by.
# (JOELwindows7)

# Pls run from the root of this project!

$VideoSource = "./src/VideosSource"
$OutputDir = "./graphics/Videos"

Get-ChildItem $VideoSource | ForEach-Object {
    $Video = "$($_.FullName)"
    $Output = Join-Path $OutputDir ($_.BaseName + ".ivf")
    $Audio = Join-Path $OutputDir ($_.BaseName + ".opus")

    # okay zed thancc, but i'll take it from here.
    #ffmpeg -i $Video -c:v libvpx -b:v 1M -c:a libvorbis -b:a 128k $Output
    #ffmpeg -i $Video -vn -acodec pcm_s16le -ar 44100 -ac 2 $Audio
    # https://zdoom.org/wiki/Video_format here we go!
    ffmpeg -i $Video -vcodec vp8 -an -f ivf $Output
    ffmpeg -i $Video -acodec libopus -vn -f opus $Audio
}

# Should I never even use Zed's autocorrect? This is fully embarrassing, fuck!
# https://github.com/UZDoom/UZDoom/issues/541
# https://github.com/UZDoom/UZDoom/issues/56
# https://github.com/UZDoom/UZDoom/issues/212

# Oh wow it work after I carefully fixed the typos & tested it. unlol tho, I used zed's autocorrect.