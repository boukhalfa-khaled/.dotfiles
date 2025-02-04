//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"Volume: ", " pamixer --get-volume-human ",	0,		10},
	{"Mem: ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	10,		20},
	{"battery: ", "awk '{print $0 \"%\"}' /sys/class/power_supply/BAT0/capacity" , 30,	20},
        {"", "cat /sys/class/power_supply/BAT0/status",                                 0,                    20},
	{"", "date '+%a %d %b - %I:%M%p'",	60,	20},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
