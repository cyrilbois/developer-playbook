# Evolutionary Architecture

[https://www.youtube.com/watch?v=8bEsNT7jdC4&t=112s&index=57&list=WL](https://www.youtube.com/watch?v=8bEsNT7jdC4&t=112s&index=57&list=WL)  
![](/assets/principles-of-evolutionary-architecture.png)

![](/assets/evolutionary-architecture.png)

* incremental: short cycle times and still a stable system \( DevOps \)
* guided: fitness function \(metrics, tests, process for measuring how close to the goal\) 

![](/assets/architecture-cycle-1.png)

![](/assets/fitness-function.png)

how much pivoting is possible at every checkpoint?

Principles In general \(evolutionary architecture\):

* Fast Feedback
* Automation \( -&gt; AI\)
* Reasonable Security
* Limited Blast Radius

Don't make comproises that impact architecture goals negativly - agree to disagree .

Tech Radars \(why?\):

* [https://zalando.github.io/tech-radar/](https://zalando.github.io/tech-radar/)
* [https://www.thoughtworks.com/de/radar](https://www.thoughtworks.com/de/radar)

fitness function -&gt; SLA [https://medium.com/developers-writing/my-take-on-evolutionary-architecture-f761d45e75b9](https://medium.com/developers-writing/my-take-on-evolutionary-architecture-f761d45e75b9)

Fitness Functions:

* Testing for "First Principles" \(basis that will be hard to correct in the long term and the negative impacts in production can only be monitored later when they stack up\) -&gt; can be de priortized for first mvp?:
  * Code Quality
  * Complexity 
  * Functionality \(easier to test and interpret where the error is on unit level but in the end only relevant on the quality level of the solution\)
* Testing "Quality" \(how good is the current solution: 
  * Real time monitoring for  \([http://benjiweber.co.uk/blog/2015/03/02/monitoring-check-smells/\](http://benjiweber.co.uk/blog/2015/03/02/monitoring-check-smells/%29\)
    * perfomormance
    * security





https://jobs.zalando.com/tech/blog/radical-agility-study-notes/?gh\_src=4n3gxh1





