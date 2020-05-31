Last login: Sun May 31 17:10:39 on ttys003

The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.
Thirumals-MacBook-Air-2:icms-config-repo thirumal$ ssh enkindle@192.168.0.27
enkindle@192.168.0.27's password: 
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun May 31 18:51:56 IST 2020

  System load:  0.25                Processes:              223
  Usage of /:   4.6% of 1006.93GB   Users logged in:        0
  Memory usage: 12%                 IP address for ens160:  192.168.0.27
  Swap usage:   0%                  IP address for docker0: 172.17.0.1

 * MicroK8s passes 9 million downloads. Thank you to all our contributors!

     https://microk8s.io/

 * Canonical Livepatch is available for installation.
   - Reduce system reboots and improve kernel security. Activate at:
     https://ubuntu.com/livepatch

94 packages can be updated.
0 updates are security updates.


Last login: Sun May 31 13:53:17 2020 from 192.168.0.3
enkindle@enkindle:~$ ls
 1                         financial_csv.csv            icms_dev_12_07_2019.sql                   indsolv_dev_01_03.sql
 50-cloud-init.yaml        fullbackup_2020_03_03.sql    icms_dev_168.sql                          indsolv_dev_01_06.sql
 Andaman.xls               git                          icms_dev_16_07_2019.sql                   indsolv_dev_02_08.sql
 Archive                   icms-27-12-2019.sql          icms_dev_17_07_2019.sql                   indsolv_dev_02_18.sql
 Archive_Email             icms@192.168.0.38            icms_dev_18_07_2019.sql                   indsolv_dev_05_03.sql
 Archive_Old               icms_04_12_2018.sql          icms_dev_18_nov_19.sql                    indsolv_dev_08_03_2019.sql
 Archive_Order_Change      icms_06_02_2020.sql          icms_dev_20_06_2019.sql                   indsolv_dev_14_09.sql
 Chennai.svg               icms_10_01.sql               icms_dev_2108.sql                         indsolv_dev_15_10.sql
'Current Year'             icms_12_02_2020.sql          icms_dev_31_10_2019.sql                   indsolv_dev_21_03_2019.sql
 Kerala.png                icms_13_12_19.sql            icms_liq.sql                              indsolv_dev_30_04_2019.sql
 LLP                       icms_2019_07_26_clean.sql    icms_qa_data_2.sql                        indsolv_qa_fresh.sql
 New_Company_Files         icms_2019_07_29.sql          icms_qa_fresh_code_admin_27_05_2019.sql   mca
 SOMS.sql                  icms_2019_12_27.sql          icms_qa_fresh_data_28_05_2019.sql         mysqlbackupS3.sh
 SOMS_2020_03_04.sql       icms_2020_02_27.sql          indsolv-client.sql                        omnidb-server_2.15.0-debian-amd64.deb
 Victoria-kolkata.ico      icms_2020_02_28.sql          indsolv-schema.sql                        openjdk-11.0.1_linux-x64_bin.tar.gz
 alfresco                  icms_2020_03_03.sql          indsolv.sql                               pgbackrest
 alfresco_2020_02_11.sql   icms_2020_03_11.sql          indsolv.sql_08_05_2018                    pgstudio.war
 alfresco_2020_02_14.sql   icms_2020_04_03.sql          indsolv.sql_22_03_2018                    pgstudio_2.0-bin.zip
 alfresco_23_09_2019.sql   icms_2020_04_27.1.sql        indsolv.sql_23_03_2018                    pgstudio_2.0.zip
 alfresco_26_09_19.sql     icms_2020_05_29.sql          indsolv.sql_25_05_2018                    post
 alfresco_27_09_19.sql     icms_2020_05_30.sql          indsolv.sql_27_04_2018                    principal_business_activity_cd.csv
 backup                    icms_24_02_2020.sql          indsolv.sql_28_05_2018                    principal_business_activity_locales.csv
 backup-tools              icms_28_04_2020.sql          indsolv.sql_30_04_2018                    soms-staging_2020_03_04.sql
 client.sql                icms_cdac.sql                indsolv.sql_without                       soms.sql
 data-1517919783360.csv    icms_cdac_2019_09_24.sql     indsolv.zip                               terracotta-logs
 ea_icms.sql               icms_cdac_2019_09_27.sql     indsolv_client.sql
 ea_icms_2020_03_11.sql    icms_client.sql              indsolv_client_demo.sql
 ea_soms.sql               icms_client_2020_03_04.sql   indsolv_dev.sql_31_05_2018
enkindle@enkindle:~$ cd /etc/init.d/
enkindle@enkindle:/etc/init.d$ ls
acpid                binfmt-support    dbus         iscsid             lxcfs           networking     postgresql       rsyslog         unattended-upgrades
apache-htcacheclean  cgroupfs-mount    docker       keyboard-setup.sh  lxd             nginx          procps           screen-cleanup  uuidd
apache2              console-setup.sh  ebtables     kmod               mdadm           open-iscsi     rabbitmq-server  ssh             x11-common
apparmor             cron              grub-common  lvm2               mdadm-waitidle  open-vm-tools  redis-server     sysstat
apport               cryptdisks        hwclock.sh   lvm2-lvmetad       mysql           plymouth       resolvconf       udev
atd                  cryptdisks-early  irqbalance   lvm2-lvmpolld      neo4j           plymouth-log   rsync            ufw
enkindle@enkindle:/etc/init.d$ vi redis-server 


        if start-stop-daemon --start --quiet --oknodo --umask 007 --pidfile $PIDFILE --chuid redis:redis --exec $DAEMON -- $DAEMON_ARGS
        then
                echo "$NAME."
        else
                echo "failed"
        fi
        ;;
  stop)
        echo -n "Stopping $DESC: "

        if start-stop-daemon --stop --retry forever/TERM/1 --quiet --oknodo --pidfile $PIDFILE --exec $DAEMON
        then
                echo "$NAME."
        else
                echo "failed"
        fi
        rm -f $PIDFILE
        sleep 1
        ;;

  restart|force-reload)
        ${0} stop
        ${0} start
        ;;

  status)
        status_of_proc -p ${PIDFILE} ${DAEMON} ${NAME}
        ;;

  *)
        echo "Usage: /etc/init.d/$NAME {start|stop|restart|force-reload|status}" >&2
        exit 1
        ;;
esac

exit 0
                                                                                                                                          89,1          Bot
