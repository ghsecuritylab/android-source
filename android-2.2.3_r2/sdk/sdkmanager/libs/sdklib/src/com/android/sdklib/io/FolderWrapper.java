/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.sdklib.io;


import java.io.File;
import java.io.FilenameFilter;
import java.net.URI;

/**
 * An implementation of {@link IAbstractFolder} extending {@link File}.
 */
public class FolderWrapper extends File implements IAbstractFolder {

    private static final long serialVersionUID = 1L;

    /**
     * Creates a new File instance from a parent abstract pathname and a child pathname string.
     * @param parent the parent pathname
     * @param child the child name
     *
     * @see File#File(File, String)
     */
    public FolderWrapper(File parent, String child) {
        super(parent, child);
    }

    /**
     * Creates a new File instance by converting the given pathname string into an abstract
     * pathname.
     * @param pathname the pathname
     *
     * @see File#File(String)
     */
    public FolderWrapper(String pathname) {
        super(pathname);
    }

    /**
     * Creates a new File instance from a parent abstract pathname and a child pathname string.
     * @param parent the parent pathname
     * @param child the child name
     *
     * @see File#File(String, String)
     */
    public FolderWrapper(String parent, String child) {
        super(parent, child);
    }

    /**
     * Creates a new File instance by converting the given <code>file:</code> URI into an
     * abstract pathname.
     * @param uri An absolute, hierarchical URI with a scheme equal to "file", a non-empty path
     * component, and undefined authority, query, and fragment components
     *
     * @see File#File(URI)
     */
    public FolderWrapper(URI uri) {
        super(uri);
    }

    /**
     * Creates a new File instance matching a give {@link File} object.
     * @param file the file to match
     */
    public FolderWrapper(File file) {
        super(file.getAbsolutePath());
    }

    public IAbstractResource[] listMembers() {
        File[] files = listFiles();
        final int count = files.length;
        IAbstractResource[] afiles = new IAbstractResource[count];

        for (int i = 0 ; i < count ; i++) {
            File f = files[i];
            if (f.isFile()) {
                afiles[i] = new FileWrapper(f);
            } else {
                afiles[i] = new FolderWrapper(f);
            }
        }

        return afiles;
    }

    public boolean hasFile(final String name) {
        String[] match = list(new FilenameFilter() {
            public boolean accept(File dir, String filename) {
                return name.equals(filename);
            }
        });

        return match.length > 0;
    }

    public IAbstractFile getFile(String name) {
        return new FileWrapper(this, name);
    }

    @Override
    public boolean exists() {
        return isDirectory();
    }
}
