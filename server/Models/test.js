const mongoose = require('mongoose')
const User = require('./User')
const Skill = require('./Skill');
// const RatedSkill = require('./RatedSkill');

mongoose.connect(
  "mongodb://student:hetic2019@ds239578.mlab.com:39578/student",
  async () => {
    await Skill.deleteMany()
    await User.deleteMany()

    // const defaultSkills = [
    //   await new Skill({ label: 'front' }).save(),
    //   await new Skill({ label: 'back' }).save(),
    // ]

    const manger = await new Skill({ label: 'manger' }).save()
    // const manger = await Skill.findOne()

    // const ratedSkill = await new RatedSkill({
    //   label: manger._id,
    //   rating: 'C'
    //  })

    const user = await User.create({
      skills: [{ skill: manger._id, rating: 'A' }]
    })


    console.log(
      JSON.stringify(
        await User.find().populate('skills.skill'),
        null, 2
      )
    )
  }
);