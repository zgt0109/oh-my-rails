copy_file 'Dockerfile'
copy_file 'docker-compose.yml'


git add: "."
git commit: %Q{ -m 'common:docker' }
