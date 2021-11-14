FROM akitenkrad/python:gpu.base

WORKDIR /root
RUN apt update -y && apt install -y tzdata && apt upgrade -y

RUN pip install --upgrade pip
RUN pip install -U numpy scipy matplotlib ipython scikit-learn pandas pillow \
                   tqdm beautifulsoup4 janome attrdict \
                   mecab-python3 gensim nltk seaborn opencv-python \
                   torch torchvision torchtext pyyaml

