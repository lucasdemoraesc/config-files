sleep 20s
killall conky
cd "/home/correalinux/.conky/gotham"
conky -c "/home/correalinux/.conky/gotham/gotham" &
cd "/home/correalinux/.conky/rss_reader"
conky -c "/home/correalinux/.conky/rss_reader/rss_reader" &
cd "/home/correalinux/.conky/slackjeff"
conky -c "/home/correalinux/.conky/slackjeff/slackjeffrc" &
