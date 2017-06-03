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
