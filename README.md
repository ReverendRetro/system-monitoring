# system-monitoring

This is a basic script you can automate via a cron job to run as needed, I default to one-hour intervals

You can schedule this script to run every hour by adding it to the crontab. Open your crontab file with:

crontab -e

Then add the following line to run the script every hour:

0 * * * * /path/to/monitoring.sh
