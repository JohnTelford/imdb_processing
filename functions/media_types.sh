 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

function intro () {
    cat << EOF
    The Intro
EOF
}

function media_type_list () {
cat << EOF

Introduction - Select (0)

* Media Types *
- Movie Types -
----------
(1) movie
(2) short
(3) episode

- TV Types -
----------
(4) tvEpisode
(5) tvMiniSeries
(6) tvMovie
(7) tvSeries
(8) tvSeries
(9) tvSpecial

- Other Types -
----------
(10) audiobook
(11) radioSeries
(12) video
(13) videoGame

Q - Quit


EOF

read -p 'Select a Media Type:  ' media_type
#echo "$media_type"
case $media_type  in
    0 | Introduction)
        intro
        ;;
    1 | movie)
        movie_type="movie"
        echo "$movie_type"
        # TODO eheck
        exit 0
        ;;

    2 | short)
        movie_type="short"
        echo "$movie_type"
        # TODO eheck
        exit 0
       ;;

    3 | episode)
        episode_type="episode"
        echo "$episode_type"
        # TODO eheck
        exit 0
        ;;

    x4 | tvEpisode)
        tvEpisode_type="tvEpisode"
        echo "$tvEpisode_type"
        # TODO eheck
        exit 0
        ;;

    5 | tvMiniSeries)
        tvMiniSeries_type="tvMiniSeries"
        echo "$tvMiniSeries_type"
        # TODO eheck
        exit 0
        ;;

   6| tvMovie)
        tvMovie_type="tvMovie"
        echo "$tvMovie_type"
        # TODO eheck
        exit 0
        ;;

    7 | tvSeries)
        tvSeries_type="tvSeries"
        echo "$tvSeries_type"
        # TODO eheck
        exit 0
        ;;

    8 | tvSeries)
        tvSeries_type="tvSeries"
        echo "$xtvSeries_type"
        # TODO eheck
        exit 0
        ;;

    9| tvSpecial)
        tvSpecial_type="tvSpecial"
        echo "$tvSpecial_type"
        # TODO eheck
        exit 0
        ;;

    10 | audiobook)
        audiobook_type="audiobook"
        echo "$audiobook_type"
        # TODO eheck
        exit 0
        ;;

   11 | radioSeries)
        radioSeries_type="radioSeries"
        echo "$radioSeries_type"
        # TODO eheck
        exit 0
        ;;

    12 | video)
        video_type="video"
        echo "$video_type"
        # TODO eheck
        exit 0
        ;;

    13 | videoGame)
        videoGame_type="videoGame"
        echo "$videoGame_type"
        # TODO eheck
        exit 0
        ;;

    *)
        echo "Unknown media type"
        exit 1
        ;;
esac 

}