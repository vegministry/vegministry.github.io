## Website Generator

The website consists of a number of sections which need to be edited frequently:
- Articles
- Events
- Calendar
- Workers
- A few other configs

For ease of editing, these are saved in a google sheet. See example [here](https://docs.google.com/spreadsheets/d/1-otVkXNn6i4tWGki9grXzc4DjG6TdQ_XWTBbJttlESU/edit#gid=1806444479). The sheet is shared so that anyone with the link can view it. You can grant as many people as you want write access.

The google sheet is contained inside a google drive has the following structure:
 - Publishing/Website (private)
 - Publishing/Website/private (private)
 - Publishing/Website/private/id_rsa (private - private key)
 - Publishing/Website/Website Data (public read access googlesheet)
 - Colab Notebooks (private)
 - Colab Notebooks/Update Website.ipyn


In the case of several users, each person can create their own `Website/private`

Once any changes have been made to the sheet, the changes are pushed to github using a [colab notebook](https://colab.research.google.com/drive/1KspUelB2ZTBFuIjmn-Xn10szzVyUI8xC?authuser=5#scrollTo=RIebRSONW-sN). A github copy is available [here](https://github.com/adventHymnals/resources/blob/master/Update_VegM_Website.ipynb). The colab notebook should be run from the same account in which the google sheet is contained so that it can access the private ssh key.


## Contents of the Google Sheet


## Refs
- [Creating form using google sheets](https://dev.to/varshithvhegde/make-your-contact-form-working-without-using-a-server-4km7)


## Modifications
To main.js, added

```js
var button = document.getElementById("videoNum0");button.click();
```
So that only a single modal is used for all videos
