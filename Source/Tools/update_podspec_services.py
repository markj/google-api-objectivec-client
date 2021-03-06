#!/usr/bin/python
#
# Copyright 2016 Google Inc. All Rights Reserved.
#
# Looks at the Source/Services directory and updates the podspec file to
# cover all the services.
#

import os
import re
import string
import sys

_PODSPEC_NAME = 'GoogleAPIClient.podspec'

def _DirNamesInDirectory(path_to_dir):
  """Returns the list of directories in a given directory."""
  result = []
  for x in os.listdir(path_to_dir):
    if x in ('.', '..'):
      continue
    full = os.path.join(path_to_dir, x)
    if os.path.isdir(os.path.join(path_to_dir, x)):
      result.append(x)
  return tuple(result)


class PodspecUpdater(object):
  """Wraps parsing the podspec file and then updating the content."""

  def __init__(self, file_content_str):
    match = re.match(
        r'^(.+\n  # subspecs for all the services.\n)(.+\n)?(end\n)$',
        file_content_str, flags=re.DOTALL)
    assert match, 'File content was not formatted as expected by the regex.'
    self._file_start = match.group(1)
    self._file_end = match.group(3)

  def UpdatedContent(self, services):
    """Generates the updated content an iterable of services dir names."""
    template = string.Template(r"""  s.subspec '${Name}' do |sp|
    sp.dependency 'GoogleAPIClient/Core'
    sp.source_files = 'Source/Services/${Name}/Generated/*.{h,m}'
    sp.exclude_files = 'Source/Services/${Name}/Generated/GTL${Name}_Sources.m'
  end
""")
    result = self._file_start
    for x in sorted(services):
      result += template.safe_substitute({'Name': x})
    result += self._file_end
    return result


def _ValidateContent(path, expected_content):
  """Helper to validate the given file's content."""
  assert os.path.isfile(path), 'File didn\'t exist: %r' % path
  name = os.path.basename(path)
  current_content = open(path).read()
  if current_content == expected_content:
    print '%s is good.' % name
  else:
    try:
      open(path, 'w').write(expected_content)
      print 'Updated %s.' % name
    except IOError as e:
      if e.errno != errno.EACCES:
        raise
      print '%r needs to be updated but is not writable.' % path
      return False
  return True


def Main(args):
  """Main method."""
  script_dir = os.path.dirname(os.path.realpath(__file__))
  root_dir = os.path.dirname(os.path.dirname(script_dir))
  podspec_path = os.path.join(root_dir, _PODSPEC_NAME)
  assert os.path.isfile(podspec_path), (
      'Failed to find %r' % _PODSPEC_NAME)
  services_dir = os.path.join(root_dir, 'Source', 'Services')
  assert os.path.isdir(services_dir), (
      'Failed to find Source/Services directory')

  updater = PodspecUpdater(open(podspec_path).read())
  services = _DirNamesInDirectory(services_dir)
  if not _ValidateContent(podspec_path, updater.UpdatedContent(services)):
    return 1

  return 0

if __name__ == '__main__':
  sys.exit(Main(sys.argv[1:]))
