
$image='dak4dotnet/sql-server:2017'
$versions='ltsc2019','1903','1909'

foreach($version in $versions) {

    docker image build --pull --build-arg WINVER="$version" `
      -t "$($image)-$($version)" .

    docker image push "$($image)-$($version)"
}

# TODO - improve
docker manifest create --amend $image `
 "$($image)-$($versions[0])" `
 "$($image)-$($versions[1])" `
 "$($image)-$($versions[2])"
 
docker manifest push $image
