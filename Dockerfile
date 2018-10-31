FROM openshift/jenkins-slave-base-centos7

ENV SPOTBUG_VER 3.1.3
ENV HOME /home/jenkins
ENV SPOTBUGS_HOME $HOME/spotbugs-$SPOTBUG_VER

WORKDIR $HOME

RUN wget -O spotbugs-$SPOTBUG_VER.tgz http://repo.maven.apache.org/maven2/com/github/spotbugs/spotbugs/$SPOTBUG_VER/spotbugs-$SPOTBUG_VER.tgz \
    && tar -zxf spotbugs-$SPOTBUG_VER.tgz \
    && rm -f spotbugs-$SPOTBUG_VER.tgz

ADD https://search.maven.org/remotecontent?filepath=com/h3xstream/findsecbugs/findsecbugs-plugin/1.8.0/findsecbugs-plugin-1.8.0.jar $SPOTBUGS_HOME/plugin/findsecbugs-plugin-1.8.0.jar

RUN yum install -y epel-release && \
    yum install -y python-pip && \
    yum clean all

RUN pip install defectdojo_api

COPY defectdojo_api/dojo_upload.py .

RUN chmod 777 $SPOTBUGS_HOME/plugin/findsecbugs-plugin-1.8.0.jar dojo_upload.py

USER 1001
