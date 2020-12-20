// ignore: unnecessary_raw_strings
const getJobs = r'''
  query GetJobs() {
    jobs {
      id,
      title,
      locationNames,
      isFeatured
    }
  }
''';
