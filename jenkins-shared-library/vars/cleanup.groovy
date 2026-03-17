def call() {
    echo 'Cleaning old containers'
    sh 'docker system prune -af || true'
}
