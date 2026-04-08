# bonfyre-example-quickstart

**30 seconds from clone to running.** Build 48 C binaries, launch a CMS, embed a document, search it.

| | Bonfyre | Typical stack |
|---|---|---|
| Install | `git clone && make` | Node.js + Python + Docker + 400 npm packages |
| Total size | **2.0 MB** (48 binaries) | 500 MB+ |
| Startup | **< 50 ms** | 30–120 seconds |
| Dependencies | C compiler + SQLite | Node.js, Python, Docker, Redis, Postgres |
| Monthly cost | **$0** | $50–500/mo (cloud APIs) |

## Prerequisites

- C11 compiler (clang on macOS, gcc on Linux — both preinstalled)
- SQLite3 headers (`brew install sqlite3` or `apt install libsqlite3-dev`)
- ~2 minutes for the first build

## Quick start

```bash
git clone https://github.com/Nickgonzales76017/bonfyre-example-quickstart.git
cd bonfyre-example-quickstart
./setup.sh        # clones bonfyre, builds it (~2 min first time)
./run.sh           # runs three demos in sequence
```

## What you'll see

### Demo 1: CMS (Content Management)

```
$ bonfyre-cms serve --port 8800

  Bonfyre CMS running on http://localhost:8800
  Binary size: 299 KB
  Memory usage: 15 MB
  Startup time: < 50 ms

  Press Ctrl+C to stop.
```

That's your entire CMS. Compare to Strapi (500 MB, 200 MB RAM, 30s startup).

### Demo 2: Text embedding

```
$ bonfyre-embed --text sample-data/document.txt --out output/doc.vecf --output-format binary --backend hash

  Embedded 384-dim vector → output/doc.vecf (1,544 bytes)
  Wall time: 4 ms (hash backend)
```

### Demo 3: Vector search

```
$ bonfyre-vec init output/vectors.db
$ bonfyre-vec insert output/vectors.db output/doc.vecf --doc-id document
$ bonfyre-vec search output/vectors.db output/query.vecf --top 3

  Results:
    1. document  score=0.9842
  Wall time: 5 ms
```

## What just happened

You built a complete backend platform and ran three different subsystems:

1. **CMS** — content management with SQLite (replaces Strapi/WordPress)
2. **Embedding** — text → vector (replaces OpenAI embeddings API)
3. **Search** — vector similarity search (replaces Pinecone/Weaviate)

All from static C binaries. No containers. No API keys. No recurring costs.

## Next steps

| Want to... | Example repo |
|---|---|
| Build a document search engine | [bonfyre-example-semantic-search](https://github.com/Nickgonzales76017/bonfyre-example-semantic-search) |
| Transcribe audio locally | [bonfyre-example-transcribe](https://github.com/Nickgonzales76017/bonfyre-example-transcribe) |
| Compress JSON payloads (13.5%) | [bonfyre-example-compress](https://github.com/Nickgonzales76017/bonfyre-example-compress) |
| Run a full SaaS backend | [bonfyre-example-saas-stack](https://github.com/Nickgonzales76017/bonfyre-example-saas-stack) |
| See all 48 binaries | [bonfyre (main repo)](https://github.com/Nickgonzales76017/bonfyre) |

## File structure

```
bonfyre-example-quickstart/
├── README.md           # This file
├── setup.sh            # Clones + builds Bonfyre
├── run.sh              # Runs the three demos
├── sample-data/
│   ├── document.txt    # Sample text for embedding
│   └── query.txt       # Sample query for search
└── output/             # Created at runtime
```

## License

MIT — same as [Bonfyre](https://github.com/Nickgonzales76017/bonfyre).
