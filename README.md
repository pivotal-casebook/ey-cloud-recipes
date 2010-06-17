ey-cloud-recipes (fork)
===============
This is a repository of some basic recipes for EY-Cloud using chef to deploy, setup, and configure common tools for Rails applications.

Installation
============

Follow these steps to use custom deployment recipes with your applications.

1. Download your ey-cloud.yml file from your EY Cloud [Extras](http://cloud.engineyard.com/extras) page and put it in your HOME directory ~/.ey-cloud.yml
2. Install the required gems: sudo gem install ey-flex
3. Add any custom recipes or tweeks to the base recipes of your own and commit them to HEAD.
4. ey-recipes --upload <cloud environment name> (not necessarily rails environment)

[eysolo]: http://www.engineyard.com/solo
[cloud]: https://cloud.engineyard.com/extras
