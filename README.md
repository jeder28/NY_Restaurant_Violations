The NY Food "Inspector"
===================


We wrote this command line app using JSON queries and Ruby, in 3 hrs to play with the NY Open Source API. We specifically used data on food inspection violations, including non-critical, critical, and non-fixed critical violations. [<i class="https://health.data.ny.gov/Health/Food-Service-Establishment-Last-Inspection/cnih-y5dw"></i> Food-Service-Establishment-Last-Inspection](#foodservicelastinspection) 

The app allows you to search for the worst or best restaurants based upon how many food inspection violations they have documented. It will return the top 10 best or worst based upon what you specified.

To use our app, simply run the controller file, enter the keywords best or worst followed by the city you would like to search:

```
>ruby controller.rb
>best Albany
```

----------
