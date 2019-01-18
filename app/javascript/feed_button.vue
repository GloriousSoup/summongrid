<template>
<div>
    <div class="food-container">
        <h2>Demon</h2>
        <p><strong>Demon Name:</strong> {{demondata.name}}</p>
        <p><strong>Current Mood:</strong> {{demonmood['.value']}}</p>
        <p><strong>Times Poked:</strong> {{demondata['times_poked']}}</p>
        <p><strong>Times Fed:</strong> {{demondata['times_fed']}}</p>
        <p>&nbsp;{{chewstring_current}}&nbsp;</p>
        <button id='feed-button' :disabled="is_feeding || !(readycount>0)" v-on:click="beginFeeding">{{feedstring}}</button>
    </div>

    <div class="summoners">
        <h2>Summoners</h2>
        <p v-for="cUser in users" :key="cUser['.key']">
        <span>{{ cUser.name }} ({{cUser.age}})</span>
        </p>
    </div>
</div>
</template>


<script>

import db from 'packs/firebase_config'


export default {
    data() {
        return {
            readycount: 0,
            animator: null,
            feedstring: 'Feed The Demon?',
            is_feeding: false,
            chew_count: 0,
            chewstring_empty: '...',
            chewstring_full: 'Om nom NOM ',
            chewstring_current: ''
        }
    },
    props: {
    },
    firebase: {
        users: db.ref(firebase_channel + '/users'),
        demondata: {source: db.ref(firebase_channel + '/demondata'), asObject: true },
        demonmood: {source: db.ref(firebase_channel + '/demondata/mood/'), asObject: true, readyCallback: function () { this.readycount++} }
    },
	methods: {
        chewstep: function() {
            if(this.is_feeding)
            {                
                var spaceCount = (this.chewstring_full.match(/ /g) || []).length;

                if( this.chew_count <= spaceCount)
                {
                    var endpoint = this.chewstring_full.split(" ", this.chew_count).join(" ").length;
                    this.chewstring_current = this.chewstring_full.substring(0, endpoint);
                }
                else
                {
                    this.chew_count = 0;
                    this.is_feeding = false;
                }
            }
            else
            {
                var stringlen = Math.min( this.chew_count/3, this.chewstring_empty.length );
                this.chewstring_current = this.chewstring_empty.substring(0, stringlen);

                if( !this.chewstring_current )
                    this.chewstring_current = "   ";

                if( this.chew_count >= (this.chewstring_empty.length * (3+1))-1 )
                    this.chew_count = -1;
            }
            this.chew_count++;
        },
        beginFeeding: function () {
            this.chew_count = 0;
            this.is_feeding = true;

            var newcount = this.demondata['times_fed'] + 1
            this.$firebaseRefs.demondata.child('times_fed').set(newcount);
        },
		feedDemon: function() {
        }
    },
    created () {
        this.chewstring_current = this.chewstring_empty;
        this.animator = setInterval(() => this.chewstep(),250 );
    },
    beforeDestroy () {
    	clearInterval(this.animator)
    }
}
</script>