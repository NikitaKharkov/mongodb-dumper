help () {
    echo 'There are 4 available options:'
    echo
    echo '-h (required) -- host name'
    echo '-p            -- port'
    echo '-d            -- database name; if not set - all database will be dumped'
    echo '-o            -- additional options for mongodump command; wrap in double quotas all the options'
}

if [ $1 == '--help' ]
 then
    help
    exit
fi

host_check=0

while getopts :h:p:f:d:o: option
  do
    case "${option}"
        in
        h) HOST=${OPTARG}; host_check=1;;
        d) DBNAME=${OPTARG};;
        o) OPTIONS=${OPTARG};;
        p) PORT=${OPTARG};;
        :)
            echo "Option $option has to be set"
            help
            exit
            ;;
        esac
done


if [[ $host_check == 0 ]]
then
    echo "-f and -h options must be set"
    help
    exit
fi

HOST=${HOST:-"localhost"}
PORT=${PORT:-27017}
OPTIONS=${OPTIONS:-""}
if [ -n DBNAME ]
 then DB="--db=$DBNAME"
 else DB=""
fi

docker run --rm mongo /bin/bash -c "mongodump --host $HOST --port $PORT --archive --gzip $DB $OPTIONS" | \
   cat > dump_${DBNAME}_$(date '+%d-%m-%Y_%H-%M-%S').archive
