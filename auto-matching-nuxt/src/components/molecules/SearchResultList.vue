<template lang="pug">
tr
  th {{ post.title }}
  th {{ post.postAt | showDate }}
  th {{ post.prefecture }}
  th {{ post.city }}
  th {{ post.profileName }}
  th {{ post.age }}
  th {{ post.profileFrom }}
  th {{ post.siteName }}
  th {{ post.category }}
  th(v-html="link")
</template>

<script lang="ts">
import Vue from 'vue'

//@ts-ignore
import DateUtil from '@/components/mixins/DateUtil'

//@ts-ignore
import Post from '@/types/post'

export default Vue.extend({
  mixins: [DateUtil],
  props: {
    post: Object
  },
  computed: {
    link: function(): string {
      return `<a href=${this.post.url} target="_blank">link</a>`
    }
  }
})
</script>
