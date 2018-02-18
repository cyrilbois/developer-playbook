# Evolutionary Architecture

Architecture should be designed for change, and you must never make comproises that impact architecture goals negatively as architecture is by definition hard to change - agree to disagree.

> An evolutionary architecture supports **incremental**, **guided change** as a first principle along **multiple dimensions **

### Architectural practices for evolution

![](/assets/principles-of-evolutionary-architecture.png)  
Source: [Patrick Kua - Goto Conference](https://www.youtube.com/watch?v=8bEsNT7jdC4&t=112s&index=57&list=WL)

* Fitness functions / SLAs: 
  * Automation \( -&gt; AI\)
  * Reasonable Security
  * Limited Blast Radius

[https://medium.com/developers-writing/my-take-on-evolutionary-architecture-f761d45e75b9](https://medium.com/developers-writing/my-take-on-evolutionary-architecture-f761d45e75b9)

Fitness Functions:

* Testing for "First Principles" \(basis that will be hard to correct in the long term and the negative impacts in production can only be monitored later when they stack up\) -&gt; can be de priortized for first mvp?:
  * Code Quality
  * Complexity 
  * Functionality \(easier to test and interpret where the error is on unit level but in the end only relevant on the quality level of the solution\)
* Testing "Quality" \(how good is the current solution: 
  * Real time monitoring for  \([http://benjiweber.co.uk/blog/2015/03/02/monitoring-check-smells/\](http://benjiweber.co.uk/blog/2015/03/02/monitoring-check-smells/%29\)
    * perfomormance
    * security

4d view:

* solution \(process & component\)
* implementation / technology \(frameworks\)
* production
* evolution

## Documentation of Architecutral Decisions

Architectural decision should be documented in a [light weight architecture decision record](https://github.com/CloudNativeTraining/architecture_decision_record). My private decision are located here in [github](https://github.com/denseidel/developer-playbook/tree/master/adr).

### Keep a technology overview with the Tech Radars:

* [https://zalando.github.io/tech-radar/](https://zalando.github.io/tech-radar/)
* [https://www.thoughtworks.com/de/radar](https://www.thoughtworks.com/de/radar)



### An Architecture for Innovation

We’re constantly pushing nonstop innovation, creativity, and hard work. To enable the above three pillars to work concisely, we’ve made a pledge regarding how we build the systems of our future based on five key principles: API First, REST, SaaS, Cloud, and Microservices.

We’re creating APIs first before we code them, using the REST architectural style to ensure we’re able to scale as our department and business grows in scope, evolving our systems in parallel. Building for SaaS makes our applications ready to live on the Internet, where embracing the cloud ensures that as a modern architecture, we’re fostering innovation. Finally, our adoption of Microservices ties all these principles together in a powerful architectural style that lets us move fast while we keep our complexity low.

Source: [Zalando Blog](https://jobs.zalando.com/tech/blog/radical-agility-study-notes/?gh_src=4n3gxh1)

## Community

[https://jobs.zalando.com/tech/](https://jobs.zalando.com/tech/)

