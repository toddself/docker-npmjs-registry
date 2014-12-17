FROM nodesource/node:trusty

RUN apt-get install -y git && \
  git clone https://github.com/npm/npm-registry-couchapp && \
  cd npm-registry-couchapp

ADD launch-npmjs.sh launch-npmjs.sh
ADD kappa.json kappa.json
  
CMD ["bash", "launch-npmjs.sh"]