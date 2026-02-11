# synthetic-data-kit-docker
A Dockerised version of [Meta's Synthetic Data Kit.](https://github.com/meta-llama/synthetic-data-kit)

Clone the repo

By default this creates QA Pairs.

Run `docker build . -t synthetic-data-kit-docker:latest`

Make a directory called `data` somewhere on your local disk, and run the following command
`mkdir -p data/{input,parsed,generated,curated,final}`

Edit `config.yaml` with the relevant API Endpoint settings - replace all instances of `<INSERT>` with the appropriate configuration.  This config is set up to use a remote inference server (in my case Ollama running in another pod).

An example config and further documentation can be found on https://github.com/meta-llama/synthetic-data-kit

Copy the `config.yaml` file to `data/config.yaml` on your local disk.

Put all the files you want to ingest into `data/input/`

Run `docker run -v "$(pwd)/data:/app/data" synthetic-data-kit-docker:latest`
