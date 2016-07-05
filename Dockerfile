FROM debian:jessie

ENV NODE_VERSION "0.10.43"

# build script directories
ENV APP_SOURCE_DIR "/var/src"
ENV APP_BUNDLE_DIR "/var/www"
ENV BUILD_SCRIPTS_DIR "/opt/reaction"
ENV APP_GIT "https://github.com/cxdongjack/reaction.git"

# Install entrypoint and build scripts
COPY scripts $BUILD_SCRIPTS_DIR

RUN chmod -R +x $BUILD_SCRIPTS_DIR

# install base dependencies, build app, cleanup
RUN bash $BUILD_SCRIPTS_DIR/install-deps.sh && \
		bash $BUILD_SCRIPTS_DIR/install-node.sh

# git clone cxdongjack/ironman
RUN bash $BUILD_SCRIPTS_DIR/clone.sh

# install meteor
RUN bash $BUILD_SCRIPTS_DIR/install-meteor.sh && \
 		cd $APP_SOURCE_DIR && \
		bash $BUILD_SCRIPTS_DIR/build-meteor.sh

# switch to production meteor bundle
WORKDIR $APP_BUNDLE_DIR/bundle

# 80 is the default meteor production port, while 3000 is development mode
EXPOSE 80

# start mongo and reaction
ENTRYPOINT ["./entrypoint.sh"]
CMD []
