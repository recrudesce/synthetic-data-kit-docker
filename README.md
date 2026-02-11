# synthetic-data-kit-docker
A Dockerised version of [Meta's Synthetic Data Kit.](https://github.com/meta-llama/synthetic-data-kit)

Clone the repo

This will create QA Pairs, as well as Chain of Thought (CoT) Reasoning examples.

Run `docker build . -t synthetic-data-kit-docker:latest`

Make a directory called `data` somewhere on your local disk, and run the following command
`mkdir -p data/{input,parsed,generated,curated,final}`

Edit `config.yaml` with the relevant API Endpoint settings - replace all instances of `<INSERT>` with the appropriate configuration.  This config is set up to use a remote inference server (in my case Ollama running in another pod).

An example config and further documentation can be found on https://github.com/meta-llama/synthetic-data-kit

Copy the `config.yaml` file to `data/config.yaml` on your local disk.

Put all the files you want to ingest into `data/input/`

Run `docker run -v "$(pwd)/data:/app/data" synthetic-data-kit-docker:latest`

QA Pair training material will be in `data/curated` and will have the `_qa_pairs_cleaned.json` suffix in the filename for each parsed input file.

CoT training material will be in `data/generated` and will have the `_cot_examples.json` suffix in the filename for each parsed input file.

All output files are in the Alpaca format.
