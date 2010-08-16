ey-cloud-recipes (fork)
===============
This is a repository of some basic recipes for EY-Cloud using chef to deploy, setup, and configure common tools for Rails applications.

Installation
============

Follow these steps to use custom deployment recipes with your applications.

1. Install the required gems: sudo gem install ey-flex
2. Add any custom recipes or tweeks to the base recipes of your own and commit them to HEAD.
3a. ey recipes upload --environment <cloud environment name> (not necessarily rails environment)
 OR
3b. rake upload_all

[eysolo]: http://www.engineyard.com/solo
