# Identifying Topics in Tweets

## Project Overview

Twitter_Topic_Modeling streams tweets from Twitter based on hashtags or keywords, and perform ETL tasks to store relevant information in SQL Server. It also applies NLP algorithms to process raw text and implements the latent Dirichlet allocation (LDA) algorithm to identify potential topics.


## Install

This project requires **Python 2.7** and the following Python libraries installed:

- [pyodbc](https://mkleehammer.github.io/pyodbc/)
- [tweepy](http://tweepy.readthedocs.io/en/v3.5.0/)
- [json](https://docs.python.org/2/library/json.html)
- [gensim](https://radimrehurek.com/gensim/)
- [itertools](https://docs.python.org/2/library/itertools.html)
- [re](https://docs.python.org/2/library/re.html)
- [pyLDAvis](https://pyldavis.readthedocs.io/en/latest/)

You will also need to have software installed to run and execute a [Jupyter Notebook](http://ipython.org/notebook.html)

If you do not have Python installed yet, it is highly recommended that you install the [Anaconda](http://continuum.io/downloads) distribution of Python, which already has the above packages and more included. Make sure that you select the Python 2.7 installer and not the Python 3.x installer.

## Code

`CreateDatabase` folder contains the SQL scripts that create the tables for storing relevant information of each tweet in Microsoft SQL Server.  You need to create the tables first, then follow this [documentation](https://github.com/mkleehammer/pyodbc/wiki) to connect Python to SQL Server. 

`twitter_streaming.ipynb` provides sample code for streaming 5000 tweets with the hashtag "#PokemonGO".

`topic_modeling.ipynb` allows you to conduct basic Natural Language Processing tasks to clean the tweets, and identify the topics.

## Run

In a terminal or command window, navigate to the top-level project directory `Twitter_Topic_Modeling/` (that contains this README), configure the `config.py` file, and run one of the following commands to stream tweets:

```bash
ipython notebook twitter_streaming.ipynb
```  
or
```bash
jupyter notebook twitter_streaming.ipynb
```

After receiving enough tweets, run one of the following commands to build your topic model:

```bash
ipython notebook topic_modeling.ipynb
```  
or
```bash
jupyter notebook topic_modeling.ipynb
```

You can find a sample output in `topic_models_visualization.png`.
