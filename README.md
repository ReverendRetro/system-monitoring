# system-monitoring

This is a basic script you can automate via a cron job to run as needed, I default to one-hour intervals

You can schedule this script to run every hour by adding it to the crontab. Open your crontab file with:

crontab -e

Then add the following line to run the script every hour:

0 * * * * /path/to/monitoring.sh

There is also a cleanup script that you can run once a day at midnight to clear out all logs older than three days, you can modify retention as needed

crontab -e

And add the following line to run the script daily at midnight:

0 0 * * * /path/to/clear_old_logs.sh
