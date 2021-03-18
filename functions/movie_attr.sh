 #!/usr/bin/env bash
DIRNAME=$(dirname "$0")
cd "$DIRNAME" || exit

function movie_title() {
echo ""
read -p 'Enter Movie Title ': m_title
echo "$m_title"
# (2) movieActorName "John Wayne"
#         note: quotes and capitalized name required
# (3) movieCategory
# (4) movieRatings
# (5) movieGeneres 
# Enter movie attribute numbers:' movie_title

}

function movie_actor_actress {
echo ""
read -p 'Enter Mmovie ove actress or actor name
Quotes are required like "John Wayne"
Enter ': m_actress_actor_name
echo "$m_actress_actor_name"
}

function movie_category {
echo ""
cat ./lists/category_list.txt
read -p 'Enter movie category': m_category
echo "$m_category"

}



